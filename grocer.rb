require "pry"
def consolidate_cart(cart)
new_cart ={}
cart.each do |atributes|                    
  if new_cart[atributes.keys[0]]            
  new_cart[atributes.keys[0]][:count] +=1   
  else 
    #binding.pry
   new_cart[atributes.keys[0]] = {          
    price: atributes.values[0][:price],
    clearance: atributes.values[0][:clearance],
    count: 1                                
  }
  #binding.pry
      end
    end
new_cart
  end
#ln 4 digs into hash without array
#ln 5 does newCart have the firts key
#ln 6 if key exists then increment the count
#ln 9 if no then add the key to newCart hash
#ln 12 and assigne its count to 1


    
def apply_coupons(cart, coupons)
 coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
    if cart[coupon[:item]][:count] >= coupon[:num]
      new_name = "#{coupon[:item]} W/COUPON"
      if cart[new_name]
        cart[new_name][:count] += coupon[:num]       
        else
          cart[new_name] = {
                            count: coupon[:num],      
              price: coupon[:cost]/coupon[:num],
              clearance: cart[coupon[:item]][:clearance] }    
              end
            cart[coupon[:item]][:count] -= coupon[:num]
              end
          end
        end
        
        cart
    end




  def apply_clearance(cart)
    new_cart = cart
    cart.each do |keys,value|
  if value[:clearance]
    new_cart[keys][:price] = (new_cart[keys][:price] * 0.8).round(2)
  end
end
  return new_cart
 #binding.pry
  end

def checkout(cart, coupons)
  #call the consolidate to get the count item first
  new_cart = consolidate_cart(cart)
  
  #apply coupon to the new cart
  apply_coupons(new_cart, coupons)
  
  #apply clearance after discount from coupon
  apply_clearance(new_cart)

total = 0
  new_cart.each do |name, hash|
    total += (hash[:price] * hash[:count])
  end

if total >= 100
    total *= 0.9
  end
#binding.pry
  total
end
























