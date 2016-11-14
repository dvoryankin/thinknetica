require "./railway.rb"


express = Train.new#(123, 'Passenger', 0)
route = Route.new(['Moscow', 'Omsk', 'Novosibirsk'])
express.route

route = Route.new(%w(omsk moscow novosibirsk))

train = Train.new
train.route = %w(omsk moscow novosibirsk)



#express.move_to_station('Omsk')



# p express
# p route
# puts express.route
















