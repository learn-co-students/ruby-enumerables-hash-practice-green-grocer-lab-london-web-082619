#input
cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]
#define method
def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item|
    item.each do |key, value|
      if consolidated_cart.has_key?(key) #if consolidated_cart already has that item...
        consolidated_cart[key][:count] += 1 #increase the count by 1
      else #else, if the item doesn't already exist in the consolidated_cart...
        consolidated_cart[key] = value #add item to the cart
        consolidated_cart[key][:count] = 1 #add a count to the attributes hash and set it equal to one
      end
    end
  end
  consolidated_cart
end

#output
cart = {
  "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
}
#input
coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

puts coupons[0][:item] #=> AVOCADO
puts cart["AVOCADO"] #=> {:price=>3.0, :clearance=>true, :count=>3}
puts cart[coupons[0][:item]] #=> {:price=>3.0, :clearance=>true, :count=>3}
puts cart[coupons[0][:item]][:count] #=> 3

coupons.each do |cpn|
  puts cpn[:item]
end #=> AVOCADO BEER CHEESE

#given a consolidated cart, returns a cart with coupons applied
def apply_coupons(cart, coupons)
  coupons.each do |cpn|
    #set variable equal to the name of the discounted item for cleaner code
    discounted_item = cpn[:item]
    #if the item exists in the cart...
    if cart[discounted_item] != nil
      #if the cart has the minimum count of items for a coupon to be valid...
      if cart[discounted_item][:count] >= cpn[:num]
        #calculate the discounted price for the item
        new_price = cpn[:cost] / cpn[:num]
        #calculate the number of items remaining at full price
        remaining_full_price = cart[discounted_item][:count] % cpn[:num] #3%2 = 1
        #calculate the number of items that will have the discounted price applied
        coupon_applied = cart[discounted_item][:count] - remaining_full_price
        #maintain the clearance status
        clearance = cart[discounted_item][:clearance]
        #create new discounted item
        cart["#{discounted_item} W/COUPON"] = {:price => new_price, :clearance => clearance, :count => coupon_applied}
        #change the previous cart number to the number remaining
        cart[discounted_item][:count] = remaining_full_price
      #else, the cart doesn't have the minimum number of items required to qualify for the coupon
      #OR the item doesn't exist in the cart
      else
        #donothing
      end
    end
  end
  cart
end

#output
# {
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 1},
#   "KALE"    => {:price => 3.00, :clearance => false, :count => 1},
#   "AVOCADO W/COUPON" => {:price => 2.50, :clearance => true, :count => 2},
# }


#input
# cart = {
#   "PEANUT BUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
#   "KALE"         => {:price => 3.00, :clearance => false, :count => 3},
#   "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
# }

#discount the price of every item on clearance by twenty percent
def apply_clearance(cart)
  cart.each do |item, attributes|
    if attributes[:clearance] == true
      clearance_price = attributes[:price] * 0.8
      attributes[:price] = clearance_price.round(2)
    else
      #do nothing
    end
  end
  cart
end

cart = {
  "PEANUT BUTTER" => {:price => 2.40, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3},
  "SOY MILK"     => {:price => 3.60, :clearance => true,  :count => 1}
}


#Create a checkout method that calculates the total cost of the consolidated cart
#It consolidates the cart, applies coupons, and applies discounts. Then, it totals the cost of the entire cart,
#accounting for each item and their prices, and returns this value.
#if, after all coupons and discounts, the cart's total is over $100, the customer gets an additional 10% off. Apply this discount when appropriate.
def checkout(cart, coupons)
  #Consolidate cart...
  consolidated_cart = consolidate_cart(cart)
  # Apply coupons...
  coupons_applied = apply_coupons(consolidated_cart, coupons)
  #Apply clearance...
  final_cart = apply_clearance(coupons_applied)
  #start cart total at zero
  cart_total = 0
  #calculate the cost of the cart...
  final_cart.each do |item, attributes|
    item_total = attributes[:price] * attributes[:count]
    cart_total = cart_total + item_total
  end
  final_total = cart_total.round(2)
  # If the final_tota is > 100...
  if final_total > 100
    final_total *= 0.9
  end
  final_total
end
