class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit unit
    @units << unit
  end

  def renters
    @units.reduce([]) do |renters, unit|
      if unit.renter
        renters << unit.renter
      end
      renters
    end
  end

  def average_rent
    occupied_units.reduce(0) { |sum, unit| sum += unit.monthly_rent } / occupied_units.length
  end

  def occupied_units
    @units.select do |unit|
      unit.renter
    end
  end
end
