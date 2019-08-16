require 'pry'
def consolidate_cart(cart)
  cart_new = {}
  cart.each do |items, count|
    items.each do |item, attribute_hash|
      cart_new[item] ||= attribute_hash
        cart_new[item][:count] ? cart_new[item][:count] += 1 :
        cart_new[item][:count] = 1
    end
  end
  cart_new
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
      name = coupon[:item] #is the name of my grocery item
      if cart[name] && cart[name][:count] >= coupon[:num]

        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += coupon[:num]
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost] / coupon[:num],
          :clearance => cart[name][:clearance], :count => coupon[:num]}
        end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, attribute_hash|
    if attribute_hash[:clearance] == true
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2)
    end
  end
cart
end

def checkout(items, coupons)
  cart = consolidate_cart(items)
  cart1 = apply_coupons(cart, coupons)
  cart2 = apply_clearance(cart1)

  total = 0

  cart2.each do |name, price|
    total += price[:price] * price[:count]
  end

  total > 100 ? total * 0.9 : total

end
