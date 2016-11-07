puts "Enter your name: "
name = gets.chomp.capitalize
puts "Enter your height: "
height = gets.chomp.to_i

optimal_weight = height - 110

if optimal_weight < 0
  puts "Hi, #{name}, your weight is already optimal."
else
  puts "Hi, #{name}, your optimal weight is #{optimal_weight}."
end
