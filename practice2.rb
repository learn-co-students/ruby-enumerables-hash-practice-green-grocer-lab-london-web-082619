
cart = {
  "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
}

#input
coupons = {:item => "AVOCADO", :num => 2, :cost => 5.00}

# coupons.each do |coupon|
#   puts coupon[:item]
# end

def apply_coupons(cart, coupons)
    coupon_item = coupon[:item]
    if cart[coupon_item][:count] >= coupons[coupon][:num] #if there are at least enough items for the coupon to be applied...
      new_price = coupons[coupon][:cost] / coupons[coupon][:num] #calculate the discounted price for the item
      remaining_full_price = cart[coupon_item][:count] % coupons[coupon][:num] #calculate the number of items remaining at full price
      coupon_applied = cart[coupon_item][:count] - remaining_full_price #calculate the number of items that will have the discounted price applied
      cart["#{coupon_item} W/COUPON"] = {:price => new_price, :clearance => true, :count => coupon_applied} #create new discounted item
      cart[coupon_item][:count] = remaining_full_price #change the previous cart number to the number remaining
      if cart[coupon_item][:count] == 0 #if there are no full price items left...
        cart.delete(coupon_item) #delete the full price item hash from the cart
      end
    else
      false
    end
  cart #return the new cart with coupons applied
end

#apply_coupons(cart, coupons)

#BRANCH CODE :

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

#given a consolidated cart, returns a cart with coupons applied
def apply_coupons(cart, coupons)
  coupons.each do |coupon|#for each coupon...
    coupon_item = coupons[coupon][:item]
    if cart[coupon_item][:count] >= coupons[coupon][:num] #if there are at least enough items for the coupon to be applied...
      new_price = coupons[coupon][:cost] / coupons[coupon][:num] #calculate the discounted price for the item
      remaining_full_price = cart[coupon_item][:count] % coupons[coupon][:num] #calculate the number of items remaining at full price
      coupon_applied = cart[coupon_item][:count] - remaining_full_price #calculate the number of items that will have the discounted price applied
      cart["#{coupon_item} W/COUPON"] = {:price => new_price, :clearance => true, :count => coupon_applied} #create new discounted item
      cart[coupon_item][:count] = remaining_full_price #change the previous cart number to the number remaining
      if cart[coupon_item][:count] == 0 #if there are no full price items left...
        cart.delete(coupon_item) #delete the full price item hash from the cart
      end
    else
      false
    end
  end
  cart #return the new cart with coupons applied
end

#output
{
  "AVOCADO" => {:price => 3.00, :clearance => true, :count => 1},
  "KALE"    => {:price => 3.00, :clearance => false, :count => 1},
  "AVOCADO W/COUPON" => {:price => 2.50, :clearance => true, :count => 2},
}


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
