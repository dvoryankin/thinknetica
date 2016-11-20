class Train

  attr_accessor :speed, :type, :carriage, :station, :route, :current_station

  def initialize(number, type, carriage = [], speed, route)
    @speed = speed
    @carriage = carriage
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

  def show_carriages
    @carriage
  end

  def add_carriage(carriage)
    if @speed.zero?
      @carriage << carriage
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

