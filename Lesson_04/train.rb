class Train

  attr_accessor :number, :carriages, :speed, :type, :carriage, :station, :route, :current_station

  # attr_reader :wagons
  # attr_writer :number, :type, :wagons

  def initialize(number, type)

    # type=nil, carriage = [], speed=0, route=Route.new)

    @speed = 0
    self.number = number
    self.type = type
    self.carriages = []
    puts "Train number #{number} type #{type} created"
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
    @carriages
  end

  def carriages_count
    @carriages.size
  end

  def add_carriage(carriage)
    if @speed.zero?
      if carriage.type == self.type.to_sym && !carriages.include?(carriage)
        @carriages << carriage
      else
        puts "Different type of train!"
      end
    else
      puts "Please, stop the train!"
    end
  end

  def remove_carriage
    if @speed.zero?
      if @carriages.size > 0
        @carriages.pop
        puts "One carriage removed"
      else
        puts "There is no carriages"
      end
    else
      puts "Please, stop the train!"
    end
  end

  def add_route(route)
    @route = route
  end

  def index
    route.stations(station)
  end

  def number
    @number
  end

  def type
    @type
  end

protected


end

