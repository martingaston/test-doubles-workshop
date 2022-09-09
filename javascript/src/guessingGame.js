class GuessingGame {
  constructor(input, number) {
    this.number = number;
    this.input = input;
    this.turns = 0;
  }

  guess() {
    this.turns += 1;

    const input = this.input.get();

    if (input == this.number) {
      return "FOUND";
    }

    if (input < this.number) {
      return "TOO_LOW";
    }

    if (input > this.number) {
      return "TOO_HIGH";
    }
  }
}

module.exports = GuessingGame;
