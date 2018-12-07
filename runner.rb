require 'json'
require 'pry'

puts 'Hello, please enter a command:
(c)ontents - Prints the contents of the vending machine.
(i)nsert money - Takes in coins and prints total money inserted.
(v)alid coin values - Prints the valid coins inputs:  Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter.
(p)urchase - Displays a prompt to enter the slot theyd like to purchase.'

raw_data   = File.read('./data/tiny_vending_machine.json')
food_data = JSON.parse(raw_data)

contents = []

food_data["contents"].map do |object|
  object.map do |k, v|
    v["contents"].map do |item|
      contents << item["type"]
    end
  end
end

if gets.chomp == 'c'
  puts contents.uniq
end


# parsed_json = food_data["results"]
#
#
# food_objects = parsed_json.map do |f|
#   Food.new(f)
# end


# puts food_objects
