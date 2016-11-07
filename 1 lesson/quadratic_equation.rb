puts "quadratic equation"

print 'Enter A: '
a = gets.chomp.to_f
print 'Enter B: '
b = gets.chomp.to_f
print 'Enter C: '
c = gets.chomp.to_f

d = b**2 - 4*a*c

puts "(- #{b} +- #{b**2} - 4 * #{a} * #{c})/2 * #{a}"

puts "discriminant is #{d}"

if d < 0
  puts "Irrational answer"
elsif d == 0
  Math.sqrt(d)
  puts -b/2*a
elsif d > 0
  puts "X1 = #{(-b + Math.sqrt(d)) / 2 * a}"
  puts "X2 = #{(-b - Math.sqrt(d)) / 2 * a}"
end
