def consolidate_cart(cart)
  # code here	  
  cart_hash = {}  
  cart.each do |item| 
    item.each do |name, value| 
      if cart_hash[name]        
        cart_hash[name][:count] += 1 
      else 
        cart_hash[name] = value 
        cart_hash[name][:count] = 1 
      end 
    end 
  end
  cart_hash # return new hash

 end	end


 def apply_coupons(cart, coupons)	def apply_coupons(cart, coupons)
  # code here	  
end	  coupons.each do |coupon| 
    if cart.keys.include? coupon[:item] 
      if cart[coupon[:item]][:count] >= coupon[:num]   than coupon num
        new_name = "#{coupon[:item]} W/COUPON" 
        if cart[new_name]
          cart[new_name][:count] += coupon[:num] # 
        else
          cart[new_name] = { 
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]  
      end
    end
  end
  cart 
end	



 def apply_clearance(cart)	def apply_clearance(cart) 
  # code here	  cart.keys.each do |item| # iterate over each cart item. 
    if cart[item][:clearance] # if it's true
      cart[item][:price] = (cart[item][:price]*0.80).round(2) # apply 20% discount
    end
  end
  cart
end	end



 def checkout(cart, coupons)	def checkout(cart, coupons)
  # code here	  consolidated_cart = consolidate_cart(cart)  # setting a new variable to equal the consolidate cart method. 
  couponed_cart = apply_coupons(consolidated_cart, coupons) # setting a new variable to equal the apply coupons method.
  final_cart = apply_clearance(couponed_cart) # setting a new variable to the apply_cleareance method.
  total = 0  # new variable set to 0 
    final_cart.each do |name, properties| # iterate over the apply clearance cart
        total += properties[:price] * properties[:count]  # total += item price times item count
    end
      total = total * 0.9 if total > 100 # apply 10% discount.
    total
end	end