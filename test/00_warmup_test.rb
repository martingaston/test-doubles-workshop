require "minitest/autorun"
require "00_warmup"

class DiceRollerTest < Minitest::Test
  def test_rolling_the_dice_100_times_returns_100_results
    # Arrange
    sides = 6
    dice_roller = DiceRoller.new(sides)

    # Act
    results = []
    100.times do
      results << dice_roller.roll
    end

    # Assert
    assert_equal 100, results.length
  end

  def test_rolling_the_dice_100_times_relies_on_dependency_injection
    # Arrange
    sides = 6
    dice_roller = DiceRoller.new(sides)

    # Act
    results = []
    100.times do
      results << dice_roller.roll
    end

    # Assert
    assert_equal 1, results.uniq.count
  end
end
