const GuessingGame = require("./guessingGame");

// javascript passes this one for us for free, amazing!
describe("GuessingGame, Dummy Test Double", () => {
  test("turns equals zero before any guesses are made", () => {
    // Arrange
    const subject = new GuessingGame();

    // Act
    const result = subject.turns;

    // Assert
    expect(result).toEqual(0);
  });
});
