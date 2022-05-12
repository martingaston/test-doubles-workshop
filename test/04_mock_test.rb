# 👩‍🏫 04_mock_test missions:
#    - Make the tests pass by adding the desired functionality to Vault (lib/04_mock.rb)

# NOTE: This is the only time we'll be using minitest's built-in mocking functionality in these exercises.
# This is because (most) mocking libraries assert their own expectations (see the verify methods)
# But one downside is this usually means learning the API of a library, which can take time/effort
# If needed, you can view Minitest's documentation here: https://www.rubydoc.info/gems/minitest/Minitest/Mock

# 🤔 How might this be useful in day-to-day development? Have a think & discuss!

require "minitest/autorun"
require "04_mock"

# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class VaultTest < Minitest::Test
  def test_mock_expectations_are_verified
    # Arrange
    username = "my-cool-username"
    password = "my-cool-password0"
    authorizer_mock = Minitest::Mock.new
    secret_location = "123 Cool Lane, Nondescript Street, UK"

    vault = Vault.new(secret_location, authorizer_mock)

    # Act
    authorizer_mock.expect :authorise, true, [username, password]
    result = vault.get username, password

    # Assert
    authorizer_mock.verify
    assert_equal secret_location, result
  end

  def test_a_failed_authorisation_will_raise
    # Arrange
    username = "mr-hacker"
    password = "hacking-the-planet"
    authorizer_mock = Minitest::Mock.new
    secret_location = "The treasure is in the castle"

    vault = Vault.new(secret_location, authorizer_mock)

    # Act
    authorizer_mock.expect :authorize, false, [username, password]

    # Assert
    authorizer_mock.verify
    assert_raises { vault.get username, password }
  end
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
