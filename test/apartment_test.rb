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

  def test_it_has_a_monthly_rent
    assert_equal 1200, @unit1.monthly_rent
  end

  def test_it_can_have_a_different_monthly_rent
    assert_equal 1800, @unit2.monthly_rent
  end

  def test_it_has_bathrooms
    assert_equal 1, @unit1.bathrooms
  end

  def test_it_can_have_different_bathrooms
    assert_equal 2, @unit2.bathrooms
  end

  def test_it_has_bedrooms
    assert_equal 1, @unit1.bedrooms
  end

  def test_it_can_have_different_bedrooms
    assert_equal 2, @unit2.bedrooms
  end

  def test_it_has_renter_that_defaults_to_nil
    assert_nil @unit1.renter
  end

  def test_it_can_add_a_renter
    renter = Renter.new("Ryan")

    @unit1.add_renter(renter)

    assert_instance_of Renter, @unit1.renter
    assert_equal renter, @unit1.renter
    assert_equal "Ryan", @unit1.renter.name
  end

  def test_it_can_add_a_different_renter
    renter = Renter.new("Steve")

    @unit1.add_renter(renter)

    assert_instance_of Renter, @unit1.renter
    assert_equal renter, @unit1.renter
    assert_equal "Steve", @unit1.renter.name
  end
end
