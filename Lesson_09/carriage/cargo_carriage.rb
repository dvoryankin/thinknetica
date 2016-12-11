class CargoCarriage < Carriage
  attr_accessor :size, :taking_size

  def initialize(producer_name, size)
    super(producer_name, :cargo)
    @size = size.to_i
    @taking_size = 0
  end

  def take_size(volume)
    @volume.to_i
    if @size > @taking_size
      @taking_size += volume
      puts "Taking size is #{taking_size}, #{@size - @taking_size} remain"
    else
      puts 'No free places'
    end
    # @size > @taking_size ? @taking_size = size - volume : "No free size"
    # @taking_size += 1 if @size > @taking_size
  end

  def free_size
    puts "Free size: #{@taking_size}"
  end

  def get_free_space(volume)
    @volume.to_i
    if @size > @taking_size
      @taking_size -= volume
      puts "Taking size is #{taking_size}, #{@size - @taking_size} remain"
    else
      puts 'No free places'
    end
    # @taking_size != 0 ? @taking_size -= 1 : "Everything is free"
  end

  def clear
    puts "Taking size is #{@taking_size = 0}"
  end
end
