
class Station

  attr_accessor :station, :name

  def initialize(name = '', trains = [])
    @name = name
    @trains = trains
  end

  def change_name(new_name)
    @name = new_name
  end

  def take_train(train)

    if @trains.include?(train)
      puts "The train already on the station"
    else
          @trains << train.to_s
    end
    #train.move_to_station(self)
  end

  def show_all_trains
    puts "The list of all trains on the station #{name}"
    @trains.each { |trains| puts "#{train.number}" }
  end




  def show_type
  end


  def send_train(train)
    if @trains.include?(train)
      puts "Train #{@number} send from station #{name}"
      @trains.delete(train)
    else
      puts "There is no such train"
    end
  end

end


class Route

  attr_accessor :route, :current_station

  def initialize(route=[])
    @route = route
  end

  
  def add_station(new)
    @route = @route.insert(-2, new)
    
  end

  def remove_station(station)
      @route.delete(station)
    end
  end

  def station_list
    @route
  end

  def first_station
    @route.first
  end


  def have_in_route?(station)
    route.include? station
  end

  def route_index(station)
    @route.index

    # index = route.index 

    # index = route.index current_station
    # puts current_station

  end

  def show_current_station
    @route[@current_station_index]
    puts "#{@route[@current_station_index]}"
  end

  def show_next_station
    @route[@current_station_index + 1]
    if (@current_station_index + 1 == nil)
      puts "It is a last station"
    else
      puts "#{@route[@current_station_index + 1]}"
    end
  end

  def show_previous_station
    @route[@current_station_index - 1]
    if (@current_station_index - 1 == -1)
      puts "You are on the first station"
    else
      puts "#{@route[@current_station_index - 1]}"
    end 
  end

end


class Train

  attr_accessor :speed, :wagons, :type, :station, :route, :have_in_route
  attr_reader :current_station_index

  def initialize(number=123, type='Passenger', wagons=0, route = Route.new)
    @speed = 0
    @wagons = wagons
    @type = type
    @number = number
    @route = route
  end



  def move_to_station(station)
 
    if route.have_in_route?(station)
      puts "Moving to #{station}"
      current_station = station
      
    else
      "no such station in the route"
    end
    @current_station_index = @route.route_index(station)

    #station.take_train(self)

  end


  



  def route
    @route
  end



  def index
    @route.index
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


  def speed_up
    @speed += 10
    puts "Increase speed on 10 km"
  end

  def stop
    @speed = 0
    puts "Train stopped"
  end

  def show_speed
    @speed
    puts "Speed is #{@speed} km/h"
  end

  def show_wagons
    @wagons
    puts "The train has #{@wagons} wagons"
  end


end



