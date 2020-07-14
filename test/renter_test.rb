require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @renter = Renter.new("Ryan")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end

  def test_it_has_a_name
    assert_equal "Ryan", @renter.name
  end
end
