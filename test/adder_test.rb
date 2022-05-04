require 'minitest/autorun'
require 'adder'

class TestAdder < Minitest::Test
  def test_adder_can_sum_properly
    assert_equal 3, Adder.new.add(1, 2)
  end
end
