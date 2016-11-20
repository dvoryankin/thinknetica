class CargoTrain < Train

  def add_carriage(carriage)
    if carriage.instance_of?(CargoCarriage)
      super(carriage)
    else
      puts "is not compatible with this type of train"
    end
  end

end