require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test
  def setup
    apartment_data1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    apartment_data2 = {number: "A2", monthly_rent: 1800, bathrooms: 2, bedrooms: 2}
    @unit1 = Apartment.new(apartment_data1)
    @unit2 = Apartment.new(apartment_data2)
  end

  def test_it_exists
    assert_instance_of Apartment, @unit1
  end

  def test_it_has_a_number
    assert_equal "A1", @unit1.number
  end

  def test_it_can_have_a_different_number
    assert_equal "A2", @unit2.number
  end
end
