require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_units_that_defaults_to_empty_array
    assert_equal [], @building.units
  end

  def test_it_has_renters_that_defaults_to_empty_array
    assert_equal [], @building.renters
  end

  def test_can_add_unit
    apartment_data = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit = Apartment.new(apartment_data)

    @building.add_unit(unit)
    assert_equal [unit], @building.units
  end

  def test_can_add_renter
    renter = Renter.new("Ryan")

    @building.add_renter(renter)
    assert_equal [renter], @building.renters
  end

  def test_average_rent
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit1 = Apartment.new(apartment_data1)
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    unit2 = Apartment.new(apartment_data2)
    expected = (1200 + 1800) / 2

    @building.add_unit(unit1)
    @building.add_unit(unit2)

    assert_equal expected, @building.average_rent
  end
end
