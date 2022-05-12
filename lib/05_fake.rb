# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class CrudApp
  def initialize(repository)
    @repository = repository
  end

  # create persists to repository and returns a hashmap with id, username and favourite_pokemon fields.
  def create(username, favourite_pokemon)
    @repository.create(username, favourite_pokemon)
  end

  # read reads from repository and returns a hashmap with id, username and favourite_pokemon fields. raises if an id is not found.
  def read(id)
    result = @repository.read(id) # repository should return nil if an item is not found

    raise "oh no" unless result

    result
  end

  # update updates an existing id in the repository and returns a boolean based on whether an update took place
  def update(id, username, favourite_pokemon)
    @repository.update(id, username, favourite_pokemon)
  end

  # delete removes an item from the repository and returns a boolean based on whether an update took place
  def delete(id)
    @repository.delete(id)
  end
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
