# The rules for heating and cooling a room are pretty straightforward:
#
# 1. Keep the room temperature between 65 and 75 degrees at all times.
# 2. If you want to heat the room, you need to turn on both the fan and the heater.
# 3. If you want to cool the room, you need to turn on both the fan and the cooler.
#
# Unfortunately, the realities of complex day-to-day development means there are a few quirks you need to think about as you write your code:
#
# - The thermostat has a lot of lag meaning that you can take an action once per minute. Any faster and it will explode.
# - After the heater is turned off, the fan stalls. You can’t turn on the fan for five minutes after the heat is turned off or it will explode.
# - After the cooler is turned off, the fan stalls. You can’t turn on the fan for three minutes after the cooler is turned off or it will explode.
# - It is dangerous to turn on the heater or cooler without the fan. They will explode...

class ExplosionError < StandardError
  def initialize(msg = "Boom!")
    super(msg)
  end
end

class HVAC
  def initialize
    @temp = 0
    @heat = false
    @cool = false
    @fan = false
  end

  attr_accessor :heat, :cool, :fan
  attr_reader :temp
end

class Thermostat
  def initialize(hvac)
    @hvac = hvac
  end

  def tick
    raise ExplosionError
  end
end
