# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class GuessingGameDummy
  def initialize(number, input)
    @number = number
    @input = input
    @turns = 0
  end

  def guess
    @turns += 1

    input = @input.get

    return "FOUND" if input == @number
    return "TOO_LOW" if input < @number
    return "TOO_HIGH" if input > @number
  end

  attr_reader :turns
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
