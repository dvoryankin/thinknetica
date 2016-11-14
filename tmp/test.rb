class Route

  attr_accessor :stations

  def initialize(route=[])
    @route = route
  end
end

class Train

  attr_accessor :speed, :wagons, :type, :station, :route
  attr_reader :current_station_index

  def initialize(number=123, type='Passenger', wagons=0, route = Route.new)
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
    @route = route
  end

  # def route
  #   @route
  # end

  def include?
    @route.include?
  end

  def index
    @route.index
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

  # def add_route(route)
  #   @route = route
  # end

  def move_to_station(station)
 
    if @route.include?(station)
      puts "Moving to #{station}"
    else
      "no such station in the route"
    end
    @current_station_index = @route.index(station)

  end


  def show_next_station
    @route[@current_station_index + 1]
  end

  def show_preview_station
    @route[@current_station_index - 1]
  end

  def show_current_station
    route.index
  end

end










class Train

  attr_accessor :speed, :wagons, :type, :station, :route

  def initialize(number=123, type='Passenger', wagons=0, route = [])
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
    @route = route
  end

  def have_in_route?(station)
    route.include? station
  end


  def speed_up
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def add_wagon
    if speed.zero?
      @wagons += 1
    else  "Please, stop the train!"
    end
  end

  def remove_wagon
    if speed.zero?
      @wagons -= 1
    else  "Please, stop the train!"
    end
  end

  def move_to_station(station)
 
    if have_in_route?(station)
      puts "Moving to #{station}"
      self.station = station
    else
      "no such station in the route"
    end
  end


  def next_station
    index = route.index station
    route[index + 1]
  end

  def previous_station
    index = route.index station
    route[index - 1]
  end
end
