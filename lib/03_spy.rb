# 🙅‍♀️ DO NOT CHANGE THIS CODE - START

class Auditer
  def record(result, timestamp)
    sleep 2 # extremely complicated business logic takes time
  end
end

class Adder
  def initialize(auditer)
    @auditer = auditer
  end

  def add(x, y)
    result = x + y

    @auditer.record(result, Time.now)

    result
  end
end

# 🙅‍♀️ DO NOT CHANGE THIS CODE - END
