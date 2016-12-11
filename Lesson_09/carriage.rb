require_relative 'producer'

class Carriage
  include Producer
  attr_accessor :type

  def initialize(producer_name, type)
    @producer_name = producer_name
    @type = type
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise 'Producer name can not be empty!' if producer_name.empty?
    raise 'Carriage type can not be empty' if type.empty?
    true
  end

  attr_reader :type
end
