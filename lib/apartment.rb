class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  def initialize(apartment_data)
    @number = apartment_data[:number]
    @monthly_rent = apartment_data[:monthly_rent]
    @bathrooms = apartment_data[:bathrooms]
    @bedrooms = apartment_data[:bedrooms]
    @renter = nil
  end
end
