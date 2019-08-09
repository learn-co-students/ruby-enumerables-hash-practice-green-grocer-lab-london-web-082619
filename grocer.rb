require "pry"
def consolidate_cart(cart)
  #binding.pry
  full_basket = {}
  cart.each do |item|
    if full_basket[item.keys[0]]
      full_basket[item.keys[0]][:count] += 1
    else
      full_basket[item.keys[0]] = {
        :price => item.values[0][:price],
        :clearance => item.values[0][:clearance],
        :count => 1
      }
    end
  end
  full_basket
end


def apply_coupons(full_basket, coupons)
  #binding.pry
  coupons.each do |item|
    #binding.pry
    product = item[:item]
    if full_basket.key?(product) && !full_basket.key?("#{product} W/COUPON") && full_basket[product][:count] >= item[:num]
      full_basket["#{product} W/COUPON"] = {
        :price => item[:cost]/item[:num], 
        :clearance => full_basket[product][:clearance], 
        :count => item[:num]
        }
      full_basket[product][:count] -= item[:num]
    elsif full_basket.key?("#{product} W/COUPON") && full_basket[product][:count] >= item[:num]
      full_basket[product][:count] -= item[:num]
      full_basket["#{product} W/COUPON"][:count] += item[:num]
    end
  end
  full_basket
end

def apply_clearance(cart)
  cart.keys.each do |item|
    #binding.pry
  if cart[item][:clearance]
    cart[item][:price] = (0.8 * cart[item][:price]).round(2)
  end
end
cart
end

def checkout(cart, coupons)
  base_check = consolidate_cart(cart)
  coupons_check = apply_coupons(base_check, coupons)
  discount_check = apply_clearance(coupons_check)
  total = 0
  discount_check.each do |item|
    #binding.pry
    total += item[1][:count] * item[1][:price]
  end
  if total > 100
    total *= 0.9
end
total
end
