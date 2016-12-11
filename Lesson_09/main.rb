require_relative 'init'
require_relative 'train'

require_relative 'route'
require_relative 'station'
require_relative 'carriage'

require_relative 'train/passenger_train'
require_relative 'train/cargo_train'
require_relative 'carriage/passenger_carriage'
require_relative 'carriage/cargo_carriage'
trains = []
stations = []

class Main
  def initialize
    @stations = []
    @trains = []
  end

  def menu
    loop do
      puts %(
      Select item:

      1. Create station
      2. Create train
      3. Attach carriage
      4. Detach carriage
      5. Send train to station
      6. Show station list
      7. Show train list on the station
      8. Show carriage list
      9. Show train list
      10. Take place or size in carriage
      11. Exit
      )
      menu = gets.chomp.to_i

      case menu
      when 1
        create_station
      when 2
        create_train
      when 3
        attach_carriage
      when 4
        detach_carriage
      when 5
        send_train
      when 6
        station_list
      when 7
        show_trains
      #   train_list
      when 8
        show_carriage
      when 9
        show_trains
      when 10
        take_place_or_size
      when 11
        exit
      else
        puts 'Wrong number'
      end
    end
  end

  def create_station
    puts 'Enter station name: '
    station = gets.chomp
    @stations << Station.new(station)
  rescue RuntimeError => e
    puts e.to_s
    retry
  ensure
    puts "station #{station} created"
  end

  def create_train
    print 'Enter train number: '
    number = gets.chomp.to_s
    print 'Enter train producer name: '
    producer = gets.chomp.to_s
    puts %(
      What kind of train you want to create?
        1. Passenger
        2. Cargo
        )
    choice = gets.chomp.to_s
    if choice == '1'
      @trains << PassengerTrain.new(number, producer)
      type = 'Passenger'
    elsif choice == '2'
      @trains << CargoTrain.new(number, producer)
      type = 'Cargo'
    else
      puts 'Wrong type of train!'
    end
    puts "#{type} train number #{number} created. Producer - #{producer}"
  rescue RuntimeError => e
    puts e.to_s
    retry
  end

  def  attach_carriage
    if !@trains.empty?
      begin
      print 'Enter carriage producer name: '
      producer = gets.chomp.to_s
      puts 'Choose train to attach: '
      index = 0
      @trains.each do |value|
        index += 1
        puts "#{index}. #{value.type} - №#{value.number}"
      end
      choice = gets.chomp.to_i
      if choice <= @trains.size
        if @trains[choice - 1].type == 'passenger'
          print 'Enter number of carriage places: '
          places = gets.chomp
          carriage = PassengerCarriage.new(producer, places)
          @trains[choice - 1].add_carriage(carriage)
        end
        if @trains[choice - 1].type == 'cargo'
          print 'Enter size of carriage: '
          size = gets.chomp
          @trains[choice - 1].add_carriage(CargoCarriage.new(producer, size))
        end
        puts 'Carriage attached to train'
      else
        puts 'Error. No such train'
      end
    rescue RuntimeError => e
      puts e.to_s
      retry
    end
    else
      puts 'Create any train at first'
    end
  end

  def detach_carriage
    if !@trains.empty?
      puts 'Choose train to detach carriage: '
      index = 0
      @trains.each do |value|
        index += 1
        puts "#{index}.#{value.type} - #{value.number}"
      end
      choice = gets.chomp.to_i
      if choice <= @trains.size
        @trains[choice - 1].remove_carriage
      else
        'Error, have no such train!'
      end
    else
      puts 'At first create a train'
    end
  end

  def send_train
    if !@trains.empty?
      puts 'Choose the train.'
      index = 0
      @trains.each do |value|
        index += 1
        puts "#{index}. #{value.type} - №#{value.number}"
      end
      choice = gets.chomp.to_i
      if choice <= @trains.size
        if !@stations.empty?
          puts 'Choose the station.'
          index = 0
          @stations.each do |value|
            index += 1
            puts "#{index}. #{value.name}"
          end
          choice2 = gets.chomp.to_i
          if choice2 <= @stations.size
            @stations[choice2 - 1].take_train(@trains[choice - 1])
            puts 'Train move to the station'
          else
            puts 'No such station'
          end
        else
          puts 'Create a station!'
        end
      else
        puts 'No such train'
      end
    else
      puts 'Create a train.'
    end
  end

  def station_list
    puts 'Station list: '
    @stations.each { |value| puts value.name.to_s }
  end

  # def train_list
  #   if @stations.size > 0
  #     puts "Choose the station"
  #     index = 0
  #     @stations.each do |value|
  #       index +=1
  #       puts "#{index}. #{value.name}"
  #     end
  #     choice = gets.chomp.to_i
  #       if choice <= @stations.size
  #         @stations[choice-1].show_all_trains
  #       else
  #         puts "No such station"
  #       end
  #   else
  #     puts "Create a station"
  #   end
  # end

  def show_carriage
    if !@trains.empty?
      puts 'Choose the train: '
      index = 0
      @trains.each do |value|
        index += 1
        puts "#{index}. #{value.type} - №#{value.number}"
      end
      choice = gets.chomp.to_i
      if choice <= @trains.size
        i = 1
        if @trains[choice - 1].type == 'passenger'
          @trains[choice - 1].show_carriages { |carriage| puts "#{i}. #{carriage.type} - free: #{carriage.free_places} - engaged: #{carriage.taking_places}"; i += 1 }
        elsif @trains[choice - 1].type == 'cargo'
          @trains[choice - 1].show_carriages { |carriage| puts "#{i}. #{carriage.type} - free: #{carriage.free_size} - engaged: #{carriage.taking_size}"; i += 1 }
        end
      else
        puts 'No such train!'
      end
    else
      puts 'Create a train at first'
    end
  end

  def show_trains
    if !@stations.empty?
      puts 'Choose station'
      index = 0
      @stations.each do |value|
        index += 1
        puts "#{index}. #{value.name}"
      end
      choice = gets.chomp.to_i
      if choice <= @stations.size
        @stations[choice - 1].show_trains { |train| puts "Train №#{train.number} - #{train.type} - #{train.carriages_count} " }
      else
        puts 'No such station'
      end
    else
      puts 'Create station at first'
    end
  end

  def take_place_or_size
    if !@trains.empty?
      puts 'Choose train'
      index = 0
      @trains.each { |train| puts "#{index += 1} - #{train.number} - #{train.type}" }
      choice = gets.chomp.to_i
      if choice <= @trains.size
        if !@trains[choice - 1].carriages.empty?
          puts 'Choose carriage'
          index = 0
          if @trains[choice - 1].type == 'cargo'
            @trains[choice - 1].show_carriages { |car| puts "#{index += 1} - #{car.type} carriage - free: #{car.free_size}- volume: #{car.size}" }
            cargo_choice = gets.chomp.to_i
            if cargo_choice <= @trains[choice - 1].carriages.size
              print 'Set the value to engage: '
              volume = gets.chomp.to_i
              @trains[choice - 1].carriages[cargo_choice - 1].take_size(volume)
              puts "Remain value: #{@trains[choice - 1].carriages[cargo_choice - 1].taking_size}"
            else
              puts 'No such carriage'
            end
          elsif @trains[choice - 1].type == 'passenger'
            @trains[choice - 1].show_carriages { |car| puts "#{index += 1} - #{car.type} carriage - places: #{car.places}" }
            pass_choice = gets.chomp.to_i
            if pass_choice <= @trains[choice - 1].carriages.size
              @trains[choice - 1].carriages[pass_choice - 1].take_place
              @trains[choice - 1].carriages[pass_choice - 1].free_places
            else
              puts 'No such train'
            end
          end
        else
          puts 'Add the carriage at first'
        end
      else
        puts 'No such train'
      end
    else
      puts 'Create the train at first'
  end

    # if @trains.size > 0
    #   puts 'Choose the train'
    #   index = 0
    #   @trains.each do |train|
    #     index +=1
    #     puts "#{index}. #{train.type} - #{train.number}"
    #   end
    #   choice = gets.chomp.to_i
    #       if choice <= @trains.size
    #         if !@trains[choice - 1].carriages.empty?
    #           puts 'Choose carriage: '
    #           i = 1
    #           @trains[choice - 1].show_carriages { |car| puts "#{i}. Carriage #{car.producer_name}"; i += 1 }
    #           choice_wagon = gets.chomp.to_i
    #           # if @trains[choice - 1].type == 'passenger'
    #           #   if choice_wagon <= @trains[choice - 1].carriages.size
    #           #     @trains[choice - 1].carriages[choice_wagon - 1].take_place
    #           #   else
    #           #     puts 'No such carriage'
    #           #   end
    #           # elsif @trains[choice - 1].type == 'cargo'
    #           #   choice_wagon = gets.chomp.to_i
    #           #     if choice_wagon <= @trains[choice - 1].carriages.size
    #           #       @trains[choice - 1].carriages[choice_wagon - 1].take_size
    #           #     else
    #           #       puts 'No such carriage'
    #           #     end
    #           # end
    #         else
    #           puts 'Add carriage to train at first'
    #         end
    #       else
    #         puts 'No such train'
    #       end
    # else
    #   puts 'Create a train at first'
    # end
  end
end

main = Main.new
main.menu
