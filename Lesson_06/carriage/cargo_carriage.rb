class CargoCarriage < Carriage

  def initialize(producer_name)
    super(producer_name, :cargo)
  end

end
