
load './train.rb'
load './route.rb'
load './station.rb'
load './carriage.rb'
load './train/cargo_train.rb'

load './train/passenger_train.rb'

load './carriage/passenger_carriage.rb'
load './carriage/cargo_carriage.rb'


# require_relative 'train'
# require_relative 'route'
# require_relative 'station'
# require_relative 'carriage'

# require_relative 'train/passenger_train'
# require_relative 'train/cargo_train'
# require_relative 'carriage/passenger_carriage'
# require_relative 'carriage/cargo_carriage'


omsk = Station.new 'omsk'
moscow = Station.new 'moscow'
minsk = Station.new 'minsk'
novosibirsk = Station.new 'novosibirsk'
kemerovo = Station.new 'kemerovo'

route = Route.new(%w(omsk moscow minsk))
route2 = Route.new(%w(omsk moscow minsk novosibirsk kemerovo))


ptrain = PassengerTrain.new(555,0,0,route)
ctrain = CargoTrain.new(1111,0,4, route)
train = Train.new(1111,'pas',0,4, route)

pascarriage = PassengerCarriage.new

carcarriage = CargoCarriage.new


ctrain.stop
ctrain.add_carriage pascarriage

ctrain.add_carriage carcarriage
ptrain.add_carriage pascarriage


puts ctrain






# #route3 = Route.new[omsk, moscow, minsk]

# train.add_route route


# train.move_to_station omsk, minsk

# train1 = Train.new(1, 'pas', 55, 000, route)
# train2 = Train.new(2, 'pas', 55, 000, route)
# train3 = Train.new(3, 'pas', 55, 000, route)


# train1.add_route route
# train2.add_route route
# train3.add_route route


# # train1.move_to_station omsk
# # train2.move_to_station omsk
# # train3.move_to_station omsk


# omsk.list_type_trains 'pas'

# omsk.send_train train1
# omsk.send_train train2
# omsk.send_train train3

# train.stop
# #train.add_wagon
# train.speed_up
# train.stop






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
















