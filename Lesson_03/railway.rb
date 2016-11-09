class Station

  def initialize(name)
    @name = name
  end

  def add_train

  end

  def show_all_trains

  end

  def show_type

  end

  def move_train

  end

end


class Route

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def add_station


  end

  def station_list

  end

end


class Train

  def initialize(number, type = "Passenger", wagons)
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
  end

  attr_accessor :speed, :wagons, :type

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

  def add_route

  end

  def move_to_station

  end

  def show_next_station

  end

  def show_preview_station

  end

  def show_station

  end

end

