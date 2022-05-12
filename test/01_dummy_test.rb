# 👩‍🏫 01_dummy_test missions:
#    - Make the tests pass by using a dummy test double to instantiate GuessingGameDummy (lib/01_dummy.rb)

require "minitest/autorun"
require "01_dummy"

# ✍️ WRITE YOUR TEST DOUBLE HERE

# class DummyInput
# end

# ✍️ END

class GuessingGameDummyTest < Minitest::Test
  def test_turns_equals_zero_before_any_guesses_are_made
    # Arrange
    number = 50
    # ✍️ You might need to add a line here
    subject = GuessingGameDummy.new(number) # ArgumentError: wrong number of arguments (given 1, expected 2)

    # Act
    result = subject.turns

    # Assert
    assert_equal 0, result
  end
end
