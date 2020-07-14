require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    @unit1 = Apartment.new(apartment_data1)
    @unit2 = Apartment.new(apartment_data2)
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_units_that_defaults_to_empty_array
    assert_equal [], @building.units
  end
end
