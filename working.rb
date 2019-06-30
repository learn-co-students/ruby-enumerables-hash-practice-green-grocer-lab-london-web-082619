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

# puts coupons[0][:item] #=> AVOCADO
# puts cart["AVOCADO"] #=> {:price=>3.0, :clearance=>true, :count=>3}
# puts cart[coupons[0][:item]] #=> {:price=>3.0, :clearance=>true, :count=>3}
# puts cart[coupons[0][:item]][:count] #=> 3
#
# coupons.each do |cpn|
#   puts cpn[:item]
# end
  #
  # coupons.each do |cpn|
  #   discounted_item = cpn[:item]
  #   puts cart[discounted_item][:count]
  #   puts discounted_number = cpn[:num]
  # end


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
        remaining_full_price = cart[discounted_item][:count] % cpn[:num]
        #calculate the number of items that will have the discounted price applied
        coupon_applied = cart[discounted_item][:count] - remaining_full_price
        #maintain the clearance status
        clearance = cart[discounted_item][:clearance]
        #create new discounted item
        cart["#{discounted_item} W/COUPON"] = {:price => new_price, :clearance => clearance, :count => coupon_applied}
        #change the previous cart number to the number remaining
        cart[discounted_item][:count] = remaining_full_price
        #if the number remaining at full price is zero...
        if cart[discounted_item][:count] == 0
          #delete the hash
          cart.delete(discounted_item)
        end
      #else, the cart doesn't have the minimum number of items required to qualify for the coupon
      #OR the item doesn't exist in the cart
      else
        #donothing
      end
    end
  end
  puts cart
end

apply_coupons(cart, coupons)
