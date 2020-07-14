require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @renter1 = Renter.new("Ryan")
    @renter2 = Renter.new("John")
  end

  def test_it_exists
    assert_instance_of Renter, @renter1
  end

  def test_it_has_a_name
    assert_equal "Ryan", @renter1.name
  end

  def test_it_can_have_a_different_name
    assert_equal "John", @renter2.name
  end
end
