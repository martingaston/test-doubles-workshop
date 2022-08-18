# 👩‍🏫 00_warmup_test missions:
#    - Make the tests pass by changing the DiceRoller class (lib/00_warmup.rb) to use dependency injection.

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

    # 🙅‍♀️ DO NOT CHANGE THIS CODE - START

    # Act
    results = []
    100.times do
      results << subject.roll
    end

    # Assert
    assert_equal 100, results.length

    # 🙅‍♀️ DO NOT CHANGE THIS CODE - END
  end

  def test_rolling_the_dice_100_times_relies_on_dependency_injection
    # Arrange
    sides = 6

    # ✍️ You may need to instantiate your new code here
    subject = DiceRoller.new(sides)

    # 🙅‍♀️ DO NOT CHANGE THIS CODE - START

    # Act
    results = []
    100.times do
      results << subject.roll
    end

    # Assert
    assert_equal 1, results.uniq.count

    # 🙅‍♀️ DO NOT CHANGE THIS CODE - END
  end
end
