class CrudApp {
  constructor(repository) {
    this.repository = repository;
  }

  create(username, favourite_pokemon) {
    return this.repository.create(username, favourite_pokemon);
  }

  read(id) {
    const result = this.repository.read(id);

    if (!result) {
      throw new Error("oh no, there was no result!");
    }

    return result;
  }

  update(id, username, favourite_pokemon) {
    return this.repository.update(id, username, favourite_pokemon);
  }

  delete(id) {
    return this.repository.delete(id);
  }
}

module.exports = CrudApp;
