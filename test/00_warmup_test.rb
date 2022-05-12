require "minitest/autorun"
require "00_warmup"

# ✍️ WRITE YOUR CODE HERE

# ✍️ END

class DiceRollerTest < Minitest::Test
  def test_rolling_the_dice_100_times_returns_100_results
    # Arrange
    sides = 6

    # ✍️ You may need to instantiate your new code here
    subject = DiceRoller.new(sides)

    # Act
    results = []
    100.times do
      results << subject.roll
    end

    # Assert
    assert_equal 100, results.length
  end

  def test_rolling_the_dice_100_times_relies_on_dependency_injection
    # Arrange
    sides = 6

    # ✍️ You may need to instantiate your new code here
    subject = DiceRoller.new(sides)

    # Act
    results = []
    100.times do
      results << subject.roll
    end

    # Assert
    assert_equal 1, results.uniq.count
  end
end
