
# begin 
# ==
# We will pass one argument 'cart'
# We will then  create an empty hash 'new_hash => {}' to keep the new results. 
# Second we will iterate over the the the cart with each.do and pass a variable key in the block. 
# The variable 'key' will be the first line of the data for e.g [{Avocado => {price => 3.00, :clearance => true }} ]

# Now we will iterate over the 'key' and assign another key value pair. 'Key'and 'value'. 
# This iteration will pick avocado as key and its value. We will assign it to the block with two variables. 
# One for avocado and another one for its value. Please note avocado is just an example it applies over any data that is given in readme.md 

# Now we will apply logical statement saying 'if new_hash[key]'
# true .we can add new key count here straight away and assign the value 
# new_hash[key][:count] += 1 
# So the if statment will check for duplicates on each line key and then return true and we push everything in the second line inside the new hash and adds count. 
# for eg. 
# { "Avocado" => {:prince => 3.00, :clearance => true, :count => 2},

# else 
#   we need to set the value to 1 which we can do it by 
#   assigning the "value" statement to the new_hash[key] = value. when you check new_hash[key] on binding.pry you will see that it will return you with '{:price=>3.0, :clearance=>true, :count=>1}'. This means new_hash[key] has :count key now already added. Now we will assign it to the value. This will condition if and else will check for duplicates and assign count value.
#   lastly we will assign it with  new_cart[key][:count] = 1. 
   
#   Our logical statement is saying if duplicate then add count. else let it remain to 1. 
   
#   Return new_hash 
   
#   Dont forget to add end. 
   
#   ==
# end
 require 'pry'
 
 def consilidate_cart(cart)
   new_hash => {} 
   cart.each do |hash|
     hash.each do |name|describe|
       binding.pry
       if new_hash[name] #checks for duplicate
       new_hash[name][:count] += 1
       else 
         new_hash[name] = describe
         new_hash[name][:count] = 1 
     
    end
  end
  new_hash
end
   
   
# apply coupon to the cart,
We first beging with assinging two argument in the method which is cart and coupon. When we check their values in binding. pry cart = 
=> {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>2}}. coupons => [{:item=>"AVOCADO", :num=>2, :cost=>5.0}]. 
We return cart if coupon === to empty array []. if it is false we set new_cart = cart. We create a new_cart variable and assigned it because we dont have to push all the values. We just want to change them. 

# adds a new key, value pair to the cart hash called 'ITEM NAME W/COUPON'
To add a new key value pair to the cart we will iterate over coupon using each.do and create a 'key'. After we assigned a variable to the coupon[:item] eg. avocado, cheese. and assign the coupon[:num] to a new variable too. 
Before we go on adding coupon price to the cart which is new_cart. we will do a conditional statement. 
saying  #if the cart has the same item in coupon and has larger amount than in coupon then remove number of the new_cart's count then 
    if cart.include?(name) && cart[name][:count] >= num_of_c
       #remove number of the new_cart's count
       new_cart[name][:count] -= num_of_c
       This should remove all the count from the cart and return to zero. So basically we have resetted the cart. This will help us start fresh and add condition that they are asking for.
# adds the coupon price to the property hash of couponed item
Here they are asking us to add the coupon price to new_cart which is cart. So we can use our conditional statement. 
saying if new cart interpolate the #name add w/coupon in the brackets is true then  add new_cart interpolate the name and w/coupon and add count 1. 
This will add +=1. The w/coupon and count in the array of new_cart. 

else we will set the value of coupon to a new value. 
  
  



# adds the count number to the property hash of couponed item
# removes the number of discounted items from the original item's count
# remembers if the item was on clearance
# accounts for when there are more items than the coupon allows
# doesn't break if the coupon doesn't apply to any items


# apply clearance:
# takes 20% off price if the item is on clearance
# does not discount the price for items not on clearance

So we pass in an argument cart. If you check binding.pry it will have the data => {"TEMPEH"=>{:price=>2.4, :clearance=>true, :count=>1}}
so we set new_cart variable equal to the cart. Because we will be comparing the new_cart with the old cart later on. 
Now we can iterate over the cart with each.do method and give a key and value. 
Key will be the Tempeh as and its value. 
We can put simple if statment saying if the value has clearance. than return 
new_cart[name][price] = cart[name][price] times it by 0.8 and round it by 2. 

This will take 20 percent of the clearance and does not discount items that are not on clearance. 

End it  and return new_cart.

def appy_clearance (cart)
  new_cart = cart 
   cart.each do |key, value| 
     if value[:clearance]
       new_cart[name][price] = (cart[name][price]*0.8).round(2)
  
  
  
end 
end 
 new_cart
 end 

# checkout:
# Apply coupon discounts if the proper number of items are present.# calls on #apply_clearance after calling on #apply_coupons when there is only one item in the cart and no coupon
# Apply 20% discount if items are on clearance.
# If, after applying the coupon discounts and the clearance discounts, the cart's total is over $100, then apply a 10% discount.
  
  def check_out (cart, coupon)
 
 We will start off by passing two arguments cart and coupon. Coupon will be an empty array and cart is the data 
 {"BEETS"=>{:price=>2.5, :clearance=>false, :count=>1}}
 so we can iterate over the cart and separate our key and value here. key will return the key here Beets and value will be the price , clearance and count. 
 
 we will give a place holder total = 0 at the beggining of the method. This will hlep us do the total after the each.do iteration. 
 Total += (value[:price] * value[:count])
 we will get the total value. 
 we can now use a condition saying if total is over >100 then we will offer total *=0.9 that is approx 10 percent discount. 
 Return the value. 
 
 to get the total. 


