const CrudApp = require("./05_fake");

class FakeRepository {}

describe("CrudApp, Fake Test Double", () => {
  test("it can create and read", () => {
    // Arrange
    const repository = new FakeRepository();
    const subject = new CrudApp();
    const username = "Ash";
    const favouritePokemon = "Pikachu";

    // Act
    const id = subject.create(username, favouritePokemon);
    const result = subject.read(id);

    // Assert
    expect(result.username).toEqual(username);
    expect(result.favoritePokemon).toEqual(favouritePokemon);
  });

  test("it can update", () => {
    // Arrange
    const repository = new FakeRepository();
    const subject = new CrudApp();
    const username = "Ash";
    const oldFavourite = "Pikachu";
    const newFavourite = "Charizard";

    // Act
    const id = subject.create(username, oldFavourite);
    const updated = subject.update(id, username, newFavourite);
    const result = subject.read(id);

    // Assert
    expect(updated).not.toBeNull();
    expect(result.username).toEqual(username);
    expect(result.favoritePokemon).toEqual(newFavourite);
  });

  test("will raise if id is deleted", () => {
    // Arrange
    const repository = new FakeRepository();
    const subject = new CrudApp();
    const username = "Ash";
    const favouritePokemon = "Pikachu";

    // Act
    const id = subject.create(username, favouritePokemon);
    const deleted = subject.delete(id);

    // Assert
    expect(deleted).not.toBeNull();
    expect(() => {
      subject.read(id);
    }).toThrow();
  });
});
