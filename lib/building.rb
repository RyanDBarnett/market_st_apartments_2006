class Building
  attr_reader :units, :renters
  def initialize
    @units = []
    @renters = []
  end

  def add_unit unit
    @units << unit
  end

  def add_renter renter
    @renters << renter
  end

  def average_rent
    @units.reduce(0) { |sum, unit| sum += unit.monthly_rent } / @units.length
  end
end
