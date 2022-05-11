require "minitest/autorun"
require "01_dummy"

class GuessingGameDummyTest < Minitest::Test
  def test_turns_equals_zero_before_any_guesses_are_made
    # Arrange
    number = 50
    subject = GuessingGameDummy.new(number) # ArgumentError: wrong number of arguments (given 1, expected 2)

    # Act
    result = subject.turns

    # Assert
    assert_equal 0, result
  end
end