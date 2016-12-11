class PassengerTrain < Train
  def initialize(number, producer_name)
    super(number, producer_name, 'passenger')
  end

  # def add_carriage(carriage)
  #   if carriage.instance_of?(PassengerCarriage)
  #     super(carriage)
  #   else
  #     puts "is not compatible with this type of train"
  #   end
  # end
end
