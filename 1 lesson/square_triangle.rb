puts "Isosceles, rectangular or equilateral"

print 'Enter side A: '
a = gets.chomp.to_f
print 'Enter side B: '
b = gets.chomp.to_f
print 'Enter side C: '
c = gets.chomp.to_f

if a > b && b > c
    hyp = a
    cat1 = b
    cat2 = c
  elsif b > a && b > c
    hyp = b
    cat1 = a
    cat2 = c
  elsif c > a && c > b
    hyp = c
    cat1 = a
    cat2 = b
end

if a == b && b ==c
  puts 'Triangle is equilateral'
  exit
end

if hyp**2 == cat1**2 + cat2 **2
  puts 'Triangle is rectangular'
  elsif cat1 == cat2
    puts 'Triangle is isosceles'
end























# if (hyp**2 == cat1**2 + cat2**2)
#     puts "Triangle is rectangular"
#     elsif cat1 == cat2
#       puts "Triangle is Isosceles"
#
# end


#
# if a > b && a > c
#   a = hyp
#   b = cat1
#   c = cat2
# elsif b > a && b > c
#   b = hyp
#   a = cat1
#   c = cat2
# elsif c > a && c > b
#   c = hyp
#   a = cat1
#   b = cat2
# end




#
# if a > b && a > c
#   if a**2 == b**2 + c**2
#     puts "Triangle is rectangular"
#     if b == c
#       puts "Triangle is isosceles"
#     end
#   end
# elsif b > a && b > c
#   if b**2 == a**2 + c**2
#     puts "Triangle is rectangular"
#     if c == a
#       puts "Triangle is isosceles"
#     end
#   end
#   elsif c > a && c > b
#     c**2 == a**2 + b**2
#     puts "Triangle is rectangular"
#     if a == b
#       puts "Triangle is isosceles"
#     end
# end




