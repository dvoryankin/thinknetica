class Station

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    train?(train)
    @trains << train
  end

  def show_all_trains
  end

  def show_type
  end

  def send_train(train)
    train = @trains.pop
  end

end


class Route

  def initialize(route = [])
    @route = route
    
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

  attr_accessor :speed, :wagons, :type, :station, :route

  def initialize(number: 01, type: "Passenger", wagons: 0)
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
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
    else  "Please, stop the train!"
    end
  end

  def add_route(route)
    @route = route
  end

  def move_to_station(station)
 
    if @route.include?(station)
      route.index(station)
    else
      "no such station in the route"
    end
       puts @route.index(station)
  end

  def show_next_station

  end

  def show_preview_station
  end

  def show_current_station
    route.index
  end

end

