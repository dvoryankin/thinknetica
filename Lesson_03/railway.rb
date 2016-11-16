class Station
  attr_writer :name
  attr_reader :list_trains

  def initialize(name)
    @name = name
    @list_trains = []
  end

  def change_name(new_name)
    @name = new_name
  end

  def take_train(train)
    unless @list_trains.include?(train)
      @list_trains << train
      else
        puts "The train already on the station"
      end
      #train.move_to_station(self)
  end

  def send_train(train)
    if @list_trains.include?(train)
      @list_trains.delete(train)
      puts "Train #{train.number} send from station #{@name}"
    else
      puts "Here is no such train"
      end
  end

  def show_all_trains
    puts "The list of all trains on the station #{@name}"
    @list_trains.each { |trains| puts "#{trains.number}" }
  end

  def list_type_trains(type)
    count_type = @list_trains.count { |train| train.type == type }
    puts "Number of trains type #{type}: #{count_type}"
  end

  def send_all_trains
    @list_trains = []
  end

  def show_name
    @name
  end

end


class Route

  attr_accessor :stations #,:current_station

  def initialize(stations=[])
    @stations = stations
  end


  def add_station(new)
    @route = @route.insert(-2, new)

  end

  def remove_station(station)
    @route.delete(station)
  end

  def station_list
    @route
  end

end


class Train

  attr_accessor :speed, :wagons, :type, :station, :route, :current_station

  def initialize(route = Route.new)
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
    @route = route
  end

  def move_to_station(station_from, station)
    if route.stations.include?(station)
      puts "Moving to #{station}"
    else
      "no such station in the route"
    end
    station.to_s
    @index = route.stations.index(station.show_name)
    station.take_train(self)
    station_from.send_train(self)
  end

  def index
    route.stations(station)
  end

  def show_current_station
    puts "current station is #{route.stations[@index]}"
  end

  def show_next_station
    if (route.stations[@index + 1] == nil)
      puts "It is a last station"
    else
      puts "next station is #{route.stations[@index + 1]}"
    end
  end

  def show_previous_station
    if (@index - 1 == -1)
      puts "You are on the first station"
    else
      puts "previous station is #{ @route.stations[@index - 1]}"
    end
  end

  def speed_up
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def show_speed
    @speed
  end

  def show_wagons
    @wagons
  end

  def add_wagon
    if @speed.zero?
      @wagons += 1
    else  "Please, stop the train!"
    end
  end

  def remove_wagon
    if @speed.zero?
      @wagons -= 1
    else
      "Please, stop the train!"
    end
  end

  def add_route(route)
    @route = route
  end


  def index
    @route.index
  end

  def number
    @number
  end

end
