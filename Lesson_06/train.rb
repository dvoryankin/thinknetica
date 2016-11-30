require './producer.rb'
require './instance_counter.rb'

class Train
  include Producer
  include InstanceCounter

  attr_accessor :trains, :number, :producer_name, :carriages, :speed, :type, :carriage, :station, :route
  NUMBER = /[a-z0-9]{3}.*[a-z0-9]{2}\z/i

  @@trains = {}

  class << self

    def find(number)
      @@trains[number]
    end

    def all
      @@trains
    end

  end

  def initialize(number, producer_name, type)
    # type=nil, carriage = [], speed=0, route=Route.new)
    self.producer_name = producer_name
    @@trains[number] = self
    @speed = 0
    self.number = number
    self.type = type
    self.carriages = []
    validate!
    #puts "Train number #{number} type #{type} created"
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Type can't be empty" if type.empty?
    raise "Number should be at least 5 symbols" if (number.to_s.length) < 5
    raise "Producer can't be empty" if producer_name.empty?
    raise "Wrong number format(XXX-XX)" if number !~ NUMBER
    true
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

end

