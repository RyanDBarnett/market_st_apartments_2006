class Apartment
  attr_reader :number
  def initialize(apartment_data)
    @number = apartment_data[:number]
  end
end
