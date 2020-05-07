
cart = {
  "AVOCADO" => {:price => 3.00, :clearance => true},
  "KALE" => {:price => 3.00, :clearance => false},
  "BLACK_BEANS" => {:price => 2.50, :clearance => false},
  "ALMONDS" => {:price => 9.00, :clearance => false},
  "TEMPEH" => {:price => 3.00, :clearance => true},
  "CHEESE" => {:price => 6.50, :clearance => false},
  "BEER" => {:price => 13.00, :clearance => false},
  "PEANUTBUTTER" => {:price => 3.00, :clearance => true},
  "BEETS" => {:price => 2.50, :clearance => false},
  "SOY MILK" => {:price => 4.50, :clearance => true}
}

#print cart.keys[1]
#print cart.values[0]

tv_show_characters = {
  "Homer Simpson" => {name: "Homer Simpson", occupation: "Nuclear Safety Inspector", hobbies: ["Watching TV", "Eating donuts"]},
  "Jon Snow" => {name: "Jon Snow", occupation: "King in the North", hobbies: ["Fighting white walkers", "Knowing nothing"]}
}

print tv_show_characters.values[0]
print tv_show_characters.values[0].keys
