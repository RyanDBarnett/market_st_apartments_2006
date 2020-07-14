class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit unit
    @units << unit
  end

  def renters
    occupied_units.map { |unit| unit.renter }
  end

  def average_rent
    occupied_units.reduce(0) { |sum, unit| sum += unit.monthly_rent } / occupied_units.length
  end

  def rented_units
    @units.select { |unit| unit.renter }
  end
end
