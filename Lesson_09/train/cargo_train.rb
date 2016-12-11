class CargoTrain < Train
  def initialize(number, producer_name)
    super(number, producer_name, 'cargo')
  end

  # def add_carriage(carriage)
  #   if carriage.instance_of?(CargoCarriage)
  #     super(carriage)
  #   else
  #     puts "is not compatible with this type of train"
  #   end
  # end

  #   def add_carriage(carriage)
  #   if carriage.type == :cargo
  #     @carriage << carriage
  #   else
  #     puts "is not compatible with this type of train"
  #   end
  # end
end
