class Vault
  # 🙅‍♀️ DO NOT CHANGE THIS CODE - START

  def initialize(secret, authoriser)
    @secret = secret
    @authoriser = authoriser
  end

  # 🙅‍♀️ DO NOT CHANGE THIS CODE - END

  def get(username, password)
    # ✍️ WRITE YOUR CODE HERE

    # need to throw an error?
    # if condition
    #   raise "not authorized"
    # end

    @secret
  end
end
