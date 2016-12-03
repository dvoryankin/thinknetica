

class PassengerCarriage < Carriage

  attr_accessor :places, :taking_places

  def initialize(producer_name, places)
    super(producer_name, :passenger)
    @places = places
    @taking_places = 0
  end

  def take_place
    @places > @taking_places ? @taking_places += 1 : "No free places"
    #@taking_places += 1 if @places > @taking_places
  end

  def taking_places
    @taking_places
  end

  def free_places
    puts "Free places: #{@places}"
  end

  def get_free_space
    @taking_places != 0 ? @taking_places -= 1 : "Everything is free"
  end

end
