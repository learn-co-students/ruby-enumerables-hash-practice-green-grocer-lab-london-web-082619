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

coupons.each do |coupon|
  if coupon[:item] == cart
    puts coupon[cart[0]]
  end
end

#given a consolidated cart, returns a cart with coupons applied
def apply_coupons(cart, coupons)
  coupons.each do |coupon| #for each coupon...
    coupon_item = coupon[:item]
    if cart[coupon_item][:count] >= coupon[:num] #if there are at least enough items for the coupon to be applied...
      new_price = coupon[:cost] / coupon[:num] #calculate the discounted price for the item
      remaining_full_price = cart[coupon_item][:count] % coupon[:num] #calculate the number of items remaining at full price
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
  puts cart #return the new cart with coupons applied
end

apply_coupons(cart, coupons)
