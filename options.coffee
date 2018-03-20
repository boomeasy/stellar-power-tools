
require "./currency-format.js"

str = ""
for key, val of CURRENCY
  #console.log key
  #console.log val
  if key == "USD"
    
  str += "<option value='#{key}'>#{val['name']}</option>\n"

console.log str    
    
