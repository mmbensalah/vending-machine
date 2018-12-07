require 'json'
require 'pry'
require './library/machine'

puts 'Hello, please enter a command:
(c)ontents - Prints the contents of the vending machine.
(i)nsert money - Takes in coins and prints total money inserted.
(v)alid coin values - Prints the valid coins inputs:  Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter.
(p)urchase - Displays a prompt to enter the slot theyd like to purchase.'

raw_data   = File.read('./data/tiny_vending_machine.json')
food_data = JSON.parse(raw_data)
contents = []

machine_objects = food_data["contents"].map do |object|
                    object.map do |k, v|
                      Machine.new(v)
                    end
                  end

contents_array = machine_objects.flatten.map do |m|
                  m.contents
                end.flatten.uniq

machine_contents = contents_array.map do |item|
                    item["type"]
                   end

if gets.chomp == 'c'
 puts machine_contents
end

# if gets.chomp == 'i'
#   x = gets.chomp
#     if x == 1 || 5 || 10 || 25
#       y = x.sum
#       puts y
#     else
#       puts 'invalid input'
#     end
# end

# if gets.chomp == 'c'
#   puts contents.uniq
# elsif gets.chomp == 'i'
#   x = gets.chomp
#     if x == 1 || 5 || 10 || 25
#       puts "good"
#     end
# else gets.chomp == 'v'
#   puts 'Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter.'
# end
