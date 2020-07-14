class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit unit
    @units << unit
  end

  def renters
    rented_units.map { |unit| unit.renter }
  end

  def average_rent
    rented_units.reduce(0) { |sum, unit| sum += unit.monthly_rent } / rented_units.length
  end

  def rented_units
    @units.select { |unit| unit.renter }
  end

  def renter_with_highest_rent
    if rented_units.length > 0
      rented_units.sort_by { |unit| unit.monthly_rent }.reverse[0].renter
    else
      nil
    end
  end
end
