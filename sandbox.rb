def consolidate_cart(cart)
  cart_hash = {}
  cart.each do | item |
    if cart_hash[item.keys[0]]
      cart_hash[item.keys[0]][:count] += 1
    else
      cart_hash[item.keys[0]] = {
        price: item.values[0][:price],
        clearance: item.values[0][:price],
        count: 1
      }
    end
  end
  p cart_hash
end

def apply_coupons(cart, coupons)
  coupons.each do | coupon |
    if cart.has_key?(coupon[:item]) && cart[coupon[:item]][:count] >= coupon[:num]
      p "Meets first criteria"
      if cart.has_key?("#{coupon[:item]} W/COUPON")
        p "Meets inner criteria"
        cart["#{coupon[:item]} W/COUPON"][:count] += coupon[:num]
      else
        cart["#{coupon[:item]} W/COUPON"] = {
          price: (coupon[:cost] / coupon[:num]),
          clearance: cart[coupon[:item]][:clearance],
          count: coupon[:num]
        }
      end
      cart[coupon[:item]][:count] -= coupon[:num]
    end
  end
  cart
end

cart =  {"AVOCADO" => {:price => 3.00, :clearance => true, :count => 5}}

coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}, {:item => "AVOCADO", :num => 2, :cost => 5.00}]

apply_coupons(cart, coupons)