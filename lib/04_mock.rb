class Vault
  def initialize(secret, authoriser)
    @secret = secret
    @authoriser = authoriser
  end

  def get(username, password)
    # ✍️ WRITE YOUR CODE HERE

    @secret
  end
end