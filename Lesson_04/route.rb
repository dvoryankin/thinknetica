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
