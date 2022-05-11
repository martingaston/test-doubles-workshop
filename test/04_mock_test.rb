require "minitest/autorun"
require "04_mock"

# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class MockTest < Minitest::Test
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
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
