class Route
  attr_accessor :stations # ,:current_station

  def initialize(stations = [])
    @stations = stations
  end

  def add_station(new)
    @stations = @stations.insert(-2, new)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def station_list
    @stations
  end
end
