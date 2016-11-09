# Заполнить хеш гласными буквами, где значением будет являться
# порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z')
vowels = {}

alphabet.each_with_index do |key, index|
  vowels[key] = index + 1 if %w(a e o u i).include?(key)
end

print vowels

