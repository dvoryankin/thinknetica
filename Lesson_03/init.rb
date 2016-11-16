require "./railway.rb"


omsk = Station.new 'omsk'
moscow = Station.new 'moscow'
minsk = Station.new 'minsk'
novosibirsk = Station.new 'novosibirsk'
kemerovo = Station.new 'kemerovo'

train = Train.new

route = Route.new(%w(omsk moscow minsk))
route2 = Route.new(%w(omsk moscow minsk novosibirsk kemerovo))

train.add_route route

train1 = Train.new(1, 'pas', 55, route)
train2 = Train.new(2, 'pas', 55, route)
train3 = Train.new(3, 'pas', 55, route)


train1.add_route route
train2.add_route route
train3.add_route route


train1.move_to_station omsk
train2.move_to_station omsk
train3.move_to_station omsk


omsk.list_type_trains 'pas'

omsk.send_train train1
omsk.send_train train2
omsk.send_train train3

train.add_wagon
train.speed_up









# express = Train.new#(123, 'Passenger', 0)
# route = Route.new(['Moscow', 'Omsk', 'Novosibirsk'])
# express.route

# route = Route.new(%w(omsk moscow novosibirsk))

# train = Train.new
# train.route = %w(omsk moscow novosibirsk)



#express.move_to_station('Omsk')



# p express
# p route
# puts express.route
















