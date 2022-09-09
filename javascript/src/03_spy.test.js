const adder = require("./03_spy");

describe("Adder, Spy Test Double", () => {
  test("it adds", () => {
    // Act
    const result = adder(1, 2);

    // Assert
    expect(result).toBe(3);
  });

  // for the sake of this exercise, try to achieve this _without_ using a jest mock
  test("it calls an auditer", () => {
    // Arrange
    const auditer = new BadSpy();

    // Act
    const result = adder(1, 2, auditer);

    // Assert

    // TODO: write an assertion here
  });
});

class BadSpy {
  record(_result, _epoch) {
    throw new Error("not implemented!");
  }
}
