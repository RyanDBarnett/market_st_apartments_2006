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
    @units.reduce(0) { |sum, unit| sum += unit.monthly_rent } / @units.length
  end
end
