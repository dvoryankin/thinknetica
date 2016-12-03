class PassengerCarriage < Carriage

  attr_accessor :places, :taking_places

  def initialize(producer_name, places)
    super(producer_name, :passenger)
    @places = places.to_i
    @taking_places = 0
  end

  def take_place
    if @places > @taking_places
      @taking_places += 1
      puts "One seat is occupied, #{@places - @taking_places} places of #{@places} remain"
    else
      puts "No free places"
    end
  end

  def taking_places
    @taking_places
  end

  def free_places
    @places - @taking_places
    puts "Free places: #{@places - @taking_places}"
  end

  def get_free_space
    if @taking_places != 0
      @taking_places -= 1
      puts "One seat has been released, #{@places - @taking_places} places of #{@places} vacant"
    else
      puts "Everything is free"
    end
  end
end
