class PassengerTrain < Train

  def add_carriage(carriage)
    if carriage.instance_of?(PassengerCarriage)
      super(carriage)
    else
      puts "is not compatible with this type of train"
    end
  end

end
