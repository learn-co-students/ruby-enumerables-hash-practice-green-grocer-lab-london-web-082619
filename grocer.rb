def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |key, value|
      if new_hash[key]
        new_hash[key][:count] += 1
      else
        new_hash[key] = value
        new_hash[key][:count] = 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  applied_cart = cart
  coupons.each do |coupon|
    coupon_item = coupon[:item]
    if cart.keys.include?(coupon_item) && cart[coupon_item][:count] >= coupon[:num]
      if applied_cart[coupon_item + " W/COUPON"] == nil
        applied_cart[coupon_item + " W/COUPON"] = {
          :price => coupon[:cost] / coupon[:num], #2.50
          :clearance => cart[coupon_item][:clearance],
          :count => coupon[:num]
        }
        applied_cart[coupon_item][:count] -= coupon[:num]
      else
        applied_cart[coupon_item + " W/COUPON"][:count] += coupon[:num]
        applied_cart[coupon_item][:count] -= coupon[:num]
      end
    end
  end
  applied_cart
end

def apply_clearance(cart)
  clearance_cart = cart 
  cart.each do |item, key|
    if key[:clearance] == true
      clearance_cart[item][:price] = (0.8 * clearance_cart[item][:price]).round(2)
    end 
  end 
  clearance_cart
end

def checkout(cart, coupons)
  final_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(final_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  total_amount = 0
  clearance_cart.each do |item, key|
    item_total = (key[:price] * key[:count]).round(2)
    total_amount += item_total
  end 
  total_amount
  total_amount > 100 ? (total_amount*=0.9).round(2) : total_amount
end
