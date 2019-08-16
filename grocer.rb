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
  #I start by iterating into my coupons array and down into the coupon hash. Again, I accomplish this with .each.
  #since this method wants  to add  coupons to  cart with a new “AVOCADO W/COUPON” , I'm going to grab coupon[:item],
  coupons.each do |coupon|
      name = coupon[:item]
      #Now I'II get to the first “if” statement. In this statement I'm using the && boolean operator
      #The && operator will evaluate to true if both the statement to the left is true and the statement to the right is true.
      #I'm basically saying, “if the cart includes the item in question,
       #AND the number of these items in cart is grater than or equal to the
       #number of items required by coupon, then execute the next line of code in “if” statement.
       #If && does not evaluate to true, meaning, I don't have any coupons to apply,
      if cart[name] && cart[name][:count] >= coupon[:num]
   #In this second "if" statement, I'm first checking to see if  cart includes  coupon name.
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += coupon[:num]
          #in the ELSE statement,I Set it equal to a hash matching the structure of all of  items' hashes.
          #I can pull  values from existing coupon and cart hashes, respectively.
          #I will also set  :count key equal to coupon[:num],
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost] / coupon[:num],
          :clearance => cart[name][:clearance], :count => coupon[:num]}
          #The last line of this statement is cart[name][:count] -= coupon[:num].
          # So after I've gone through  inner if/else statement with coupon,
          #I then reduce item :count by the number of items used by our coupon.
        end
        #Then I return updated cart.
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  #I iterate into  cart using .each then use an "if" statement to check if the :clearance key is true.
  #If true,I need to discount and update  item price
  #I can do this by assigning  key a new value, in this case, the value is item :price multiplied by 0.8
  #(which is the same as taking 20% off) and rounded to 2 decimal places
  #Then return updated cart.
  cart.each do |item, attribute_hash|
    if attribute_hash[:clearance] == true
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2)
    end
  end
cart
end

def checkout(items, coupons)
  #The first I run consolidate_cart method with the cart hash that is passed in,
  # and store the return from this method in a variable; I call it cart
  #This is the new consolidated cart
  cart = consolidate_cart(items)
  #Run apply_coupons method with our consolidated cart1 and the coupons that will passed in as an argument.
  cart1 = apply_coupons(cart, coupons)
  #Run our apply_clearance method with our newly created cart1
  # and store this in a variable as well, cart2
  cart2 = apply_clearance(cart1)
#create a variable total to store the final cart total
  total = 0
#I iterate into cart2 using .each. Then I increment
#total variable by multiplying each item's :price by each item's :count
#and then adding this to  running total.
#This will update total variable as I iterate through every item in the cart
  cart2.each do |name, price|
    total += price[:price] * price[:count]
  end
#Last, I’ll check if  total is over 100. If so, I'll take 10% off. Here is the code that accomplishes this:
  total > 100 ? total * 0.9 : total
end
