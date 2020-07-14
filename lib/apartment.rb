class Apartment
  attr_reader :number, :monthly_rent
  def initialize(apartment_data)
    @number = apartment_data[:number]
    @monthly_rent = apartment_data[:monthly_rent]
  end
end
