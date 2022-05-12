# 👩‍🏫 05_fake_test missions:
#    - Implement the FakeRepository in order to make the tests pass. Take a look at CrudApp in lib/05_fake for API details.
#    - If you're struggling, an in-memory data store using a HashMap/object is probably the most straightforward route.

require "minitest/autorun"
require "05_fake"

# ✍️ WRITE YOUR TEST DOUBLE HERE

class FakeRepository
end

# ✍️ END

# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class TestCrudApp < Minitest::Test
  def test_can_create_and_read
    # Arrange
    repository = FakeRepository.new
    subject = CrudApp.new(repository)
    username = "Ash"
    favourite_pokemon = "Pikachu"

    # Act
    id = subject.create(username, favourite_pokemon)
    result = subject.read(id)

    # Assert
    assert_equal username, result[:username]
    assert_equal favourite_pokemon, result[:favourite_pokemon]
  end

  def test_can_update
    # Arrange
    repository = FakeRepository.new
    subject = CrudApp.new(repository)
    username = "Ash"
    old_favourite = "Pikachu"
    new_favourite = "Charizard"

    # Act
    id = subject.create(username, old_favourite)
    updated = subject.update(id, username, new_favourite)
    result = subject.read(id)

    # Assert
    assert updated
    assert_equal username, result[:username]
    assert_equal new_favourite, result[:new_favourite]
  end

  def test_will_raise_if_id_is_deleted
    # Arrange
    repository = FakeRepository.new
    subject = CrudApp.new(repository)
    username = "Ash"
    favourite_pokemon = "Pikachu"

    # Act
    id = subject.create(username, favourite_pokemon)
    deleted = subject.delete(id)

    # Assert
    assert deleted
    assert_raises { subject.read(id) }
  end
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
