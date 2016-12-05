class Station
  attr_writer :name
  attr_reader :list_trains

  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @list_trains = []
    @@stations << self
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise 'Name can not be empty!' if @name.empty?
    true
  end

  def change_name(new_name)
    @name = new_name
  end

  def take_train(train)
    if @list_trains.include?(train)
      puts 'The train already on the station'
    else
      @list_trains << train
    end
    # train.move_to_station(self)
  end

  def send_train(train)
    if @list_trains.include?(train)
      @list_trains.delete(train)
      puts "Train #{train.number} send from station #{@name}"
    else
      puts 'Here is no such train'
    end
  end

  def show_trains
    list_trains.each { |train| yield(train) }
  end

  def show_all_trains
    puts "The list of all trains on the station #{@name}"
    @list_trains.each { |train| puts "№#{train.number} - type: #{train.type} - carriages: #{train.carriages_count}" }
  end

  def list_type_trains(type)
    count_type = @list_trains.count { |train| train.type == type }
    puts "Number of trains type #{type}: #{count_type}"
  end

  def send_all_trains
    @list_trains = []
  end

  attr_reader :name
end
