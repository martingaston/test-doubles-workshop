require "minitest/autorun"
require "02_stub"

# ✍️ WRITE YOUR TEST DOUBLE HERE

# class MyCoolTestDouble
#   def cool_method
#     "cool"
#   end
# end

# ✍️ END

# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class GuessingGameStubTest < Minitest::Test
  def test_will_return_found_if_the_guess_is_correct
    # Arrange
    number = 50
    input = nil
    subject = GuessingGameStub.new(number, input)

    # Act
    result = subject.guess

    # Assert
    assert_equal FOUND, result
  end

  # 🙅‍♀️ DO NOT CHANGE THIS CODE - END

  # ✍️ WRITE YOUR TESTS HERE

  def test_will_return_too_low_if_the_guess_is_too_low
    fail "TODO: implement me"
  end

  def test_will_return_too_high_if_the_guess_is_too_high
    fail "TODO: implement me"
  end
end

# ✍️ END
