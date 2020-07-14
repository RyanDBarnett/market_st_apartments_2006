require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test
  def setup
    @unit1 = Apartment.new()
    @unit2 = Apartment.new()
  end

  def test_it_exists
    assert_instance_of Apartment, @unit1
  end
end
