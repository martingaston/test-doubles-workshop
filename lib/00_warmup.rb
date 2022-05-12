class DiceRoller
  # 👍 you can edit this method
  def initialize(sides, rng)
    @sides = sides
  end

  # 🙅‍♀️ DO NOT CHANGE THIS CODE - START

  # rolls the dice
  def roll
    random_number_generator(@sides)
  end

  private

  # 🙅‍♀️ DO NOT CHANGE THIS CODE - END

  # returns an integer within the interval [0, endpoint)
  # 👍 you can edit this method
  def random_number_generator(endpoint)
    rand(endpoint)
  end
end
