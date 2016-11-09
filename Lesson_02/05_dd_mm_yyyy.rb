# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday
# или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru


print "Enter day: "
day = gets.to_i

print "Enter month: "
month = gets.to_i

print "Enter year: "
year = gets.to_i


months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
  months[1] = 29
end

num = 0
x = 0

while x < month
  num += months[x]
  x += 1
end

num += day

puts "day number: #{num}"

