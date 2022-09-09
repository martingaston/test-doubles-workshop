class Vault {
  constructor(secret, authoriser) {
    this.secret = secret;
    this.authoriser = authoriser;
  }

  get(username, password) {
    // WRITE YOUR CODE HERE

    // need to throw an error?
    //
    // if (condition) {
    //   throw new Error("oh no");
    // }

    return this.secret;
  }
}

module.exports = Vault;
