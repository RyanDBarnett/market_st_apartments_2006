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

  def test_renters_updates_when_renter_added_to_unit
    renter = Renter.new("Ryan")
    apartment_data = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit = Apartment.new(apartment_data)
    @building.add_unit(unit)

    assert_equal [], @building.renters

    unit.add_renter(renter)

    assert_equal [renter], @building.renters
  end

  def test_rented_units
    renter1 = Renter.new("Ryan")
    renter2 = Renter.new("Bob")
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit1 = Apartment.new(apartment_data1)
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    unit2 = Apartment.new(apartment_data2)

    @building.add_unit(unit1)
    @building.add_unit(unit2)

    assert_equal [], @building.rented_units

    unit1.add_renter(renter1)

    assert_equal [unit1], @building.rented_units

    unit2.add_renter(renter2)

    assert_equal [unit1, unit2], @building.rented_units
  end

  def test_average_rent
    renter1 = Renter.new("Ryan")
    renter2 = Renter.new("Bob")
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit1 = Apartment.new(apartment_data1)
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    unit2 = Apartment.new(apartment_data2)

    @building.add_unit(unit1)
    @building.add_unit(unit2)

    assert_equal [], @building.renters

    unit1.add_renter(renter1)

    assert_equal 1200, @building.average_rent

    unit2.add_renter(renter2)

    assert_equal 1500, @building.average_rent
  end

  def test_renter_with_highest_rent
    renter1 = Renter.new("Ryan")
    renter2 = Renter.new("Bob")
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    unit1 = Apartment.new(apartment_data1)
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    unit2 = Apartment.new(apartment_data2)

    @building.add_unit(unit1)
    @building.add_unit(unit2)

    assert_nil @building.renter_with_highest_rent

    unit1.add_renter(renter1)

    assert_equal renter1, @building.renter_with_highest_rent

    unit2.add_renter(renter2)

    assert_equal renter2, @building.renter_with_highest_rent
  end
end
