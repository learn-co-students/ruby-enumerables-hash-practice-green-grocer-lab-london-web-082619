def consolidate_cart(cart)
  #create new hash to store consolidated cart in
  consolidated_cart = {}
  
  #iterate through each item in the cart
  cart.each do |shopping|
   shopping.each do |item, item_details|
     
     #if the newly created hash already includes an item, increase the :count by 1
     if consolidated_cart.keys.include?(item)
       consolidated_cart[item][:count] += 1
     
     #if not, add the item to the hash with a :count of 1
     else
       consolidated_cart[item] = item_details
       consolidated_cart[item][:count] = 1
     end
   end
  end
  
  #return consolidated cart
   consolidated_cart
end

#apply_coupons takes two arguments, the cart data and any coupons
def apply_coupons(cart, coupons)
  
  #iterate through the coupons
  coupons.each do |coupon|
     
     #create variable - item - which has the value of the item: key in the coupon
     item = coupon[:item]
     
     #look up item in cart and check if it is enough (or more than enough) for the coupon to be valid
     if cart[item] && cart[item][:count] >= coupon[:num]  
      
      #check if coupon has already been applied (or multiple coupons)
        if cart["#{item} W/COUPON"]
          cart["#{item} W/COUPON"][:count] += coupon[:num]

        else 
           cart["#{item} W/COUPON"] = { 
             price: coupon[:cost] / coupon[:num],
             clearance: cart[item][:clearance],
             count: coupon[:num]
           }
       end
       cart[item][:count] -= coupon[:num]
     end
   end
   cart
end


# iterate through items in cart and if clearance value is true, apply a 20% discount - rounded to 2 decimal places
def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] === true
      details[:price] = (details[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(applied_coupons)
  
  cart_total = 0

  final_cart.each do |item_name, value|
    cart_total += value[:price] * value[:count]
  end
  
  #check total value of cart - if it is over 100 apply 10% discount
  cart_total > 100 ? cart_total * 0.9 : cart_total
  
end
