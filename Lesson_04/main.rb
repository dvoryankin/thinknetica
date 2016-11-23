require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'init'

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


      def create_station
        puts "Enter station name: "
        station = gets.chomp
        @stations << Station.new(station)
        puts "station #{station} created"
      end

      def create_train
        print "Enter train number: "
          number = gets.chomp.to_s
          puts %Q(
            What kind of train you want to create?
            1. Passenger
            2. Cargo
            )
          choice = gets.chomp.to_s
          if choice == '1'
            @trains << PassengerTrain.new(number)
            puts "Passenger train number #{number} created."
          elsif choice == '2'
            @trains << CargoTrain.new(number)
            puts "Cargo train number #{number} created."
          else
            puts "Wrong type of train!"
          end
      end

      def  attach_carriage
        if @trains.size > 0
          puts "Choose train to attach: "
          index = 0
          @trains.each do |value|
            index +=1
            puts "#{index}. #{value.type} - №#{value.number}"
          end
          choice = gets.chomp.to_i
          if choice <= @trains.size
            @trains[choice-1].add_carriage(PassengerCarriage.new) if @trains[choice-1].type == "passenger"
            @trains[choice-1].add_carriage(CargoCarriage.new) if @trains[choice-1].type == "cargo"
            puts "Carriage attached"
          else
            puts "Error. No such train"
          end
        else
          puts "Create any train at first"
        end
      end

      def detach_carriage
        if @trains.size > 0
          puts "Choose train to detach carriage: "
          index = 0
          @trains.each do |value|
            index +=1
            puts "#{index}.#{value.type} - #{value.number}"
          end
          choice = gets.chomp.to_i
          if choice <= @trains.size
            @trains[choice-1].remove_carriage
          else
            "Error, have no such train!"
          end
        else
          puts "At first create a train"
        end
      end

      def send_train
        if @trains.size > 0
          puts "Выберите поезд."
          index = 0
          @trains.each do |value|
            index += 1
            puts "#{index}. #{value.type} - №#{value.number}"
          end
          choice = gets.chomp.to_i
          if choice <= @trains.size
            if @stations.size > 0
              puts "Теперь выберите станцию."
              index = 0
              @stations.each do |value|
                index +=1
                puts "#{index}. #{value.name}"
              end
              choice2 = gets.chomp.to_i
              if choice2 <= @stations.size
                @stations[choice2-1].take_train(@trains[choice-1])
                puts "Train move to the station"
              else
                puts "No such station"
              end
            else
              puts "Create a station!"
            end
          else
            puts "No such train"
          end
        else
          puts "Create a train."
        end
      end


      def station_list
        puts "Station list: "
        @stations.each { |value| puts "#{value.name}" }
      end

      def train_list
        if @stations.size > 0
          puts "Choose the station"
          index = 0
          @stations.each do |value|
            index +=1
            puts "#{index}. #{value.name}"
          end
          choice = gets.chomp.to_i
            if choice <= @stations.size
              @stations[choice-1].show_all_trains
            else
              puts "No such station"
            end
        else
          puts "Create a station"
        end
      end



     puts %Q(
      Select item:

      1. Create station
      2. Create train
      3. Attach carriage
      4. Detach carriage
      5. Send train to station
      6. Show station list
      7. Show train list on the station
      8. Exit
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
        train_list
      when 8
        exit
      else
        puts "Wrong number"
      end

      end
  end
end


main = Main.new
main.menu
