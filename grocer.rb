def consolidate_cart(cart)

  new_cart = {} 
  cart.each do |items| 
    items.each do |key, value| 
      new_cart[key] ||= value 
      new_cart[key][:count] ? new_cart[key][:count] += 1 :   
      new_cart[key][:count] = 1 
  end 
end 

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon| 
    coupon.each do |key, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart 
end

def apply_clearance(cart)
  # code here
  cart.each do |item, attribute| 
    if attribute[:clearance] == true 
      attribute[:price] = (attribute[:price] *
      0.8).round(2) 
    end 
  end 
cart 
end
end

def checkout(cart, coupons)
  # code here
  total = 0 
  new_cart = consolidate_cart(cart) 
  coupon_cart = apply_coupons(new_cart, coupons) 
  clearance_cart = apply_clearance(coupon_cart) 
  clearance_cart.each do |item, attribute| 
    total += (attribute[:price] * attribute[:count])
  end 
total = (total * 0.9) if total > 100 total 
end
