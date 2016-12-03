class CargoCarriage < Carriage

  attr_accessor :size, :taking_size

  def initialize(producer_name, size)
    super(producer_name, :cargo)
    @size = size
    @taking_size = 0

  end

  def take_size
    @size > @taking_size ? @taking_size += 1 : "No free size"
    #@taking_size += 1 if @size > @taking_size
  end

  def taking_size
    @taking_size
  end

  def free_size
    puts "Free size: #{@size}"
  end

  def get_free_space
    @taking_size != 0 ? @taking_size -= 1 : "Everything is free"
  end

end
