const GuessingGame = require("./guessingGame");

class InputStub {
  constructor() {
    throw new Error("not implemented");
  }
}

describe("Guessing Game, Stub Test Double", () => {
  test("will return FOUND if the guess is correct", () => {
    // Arrange
    const number = 50;
    const input = new InputStub();
    const subject = GuessingGame(input, number);

    // Act
    result = subject.guess();

    // Assert
    expect(result).toEqual("FOUND");
  });

  test("will return TOO_LOW if the guess is too low", () => {
    throw new Error("TODO: implement me");
  });

  test("will return TOO_HIGH if the guess is too high", () => {
    throw new Error("TODO: implement me");
  });
});
