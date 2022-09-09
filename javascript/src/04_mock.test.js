const Vault = require("./04_mock");

describe("Vault, Mock Test Double", () => {
  test("mock expectations are verified", () => {
    // Arrange
    const username = "my-cool-username";
    const password = "my-cool-password123";
    const secretLocation = "123 Cool Lane, Secret Street";

    const authoriserMock = jest.fn();
    authoriserMock.mockReturnValue(true);

    const vault = new Vault(secretLocation, authoriserMock);

    // Act
    const result = vault.get(username, password);

    // Assert
    expect(authoriserMock.mock.calls.length).toEqual(1);
    expect(authoriserMock.mock.calls[0][0]).toEqual(username);
    expect(authoriserMock.mock.calls[0][1]).toEqual(password);

    expect(result).toEqual(secretLocation);
  });

  test("a failed authorisation will raise", () => {
    // Arrange
    const username = "mrs-hacker";
    const password = "hacking-the-planet";
    const secretLocation = "the valuable treasure is in the castle";

    const authoriserMock = jest.fn();
    authoriserMock.mockReturnValue(false);

    const vault = new Vault(secretLocation, authoriserMock);

    // Assert
    expect(() => {
      vault.get(username, password);
    }).toThrow();

    expect(authoriserMock.mock.calls.length).toEqual(1);
    expect(authoriserMock.mock.calls[0][0]).toEqual(username);
    expect(authoriserMock.mock.calls[0][1]).toEqual(password);
  });
});
