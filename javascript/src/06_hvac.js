// The rules for heating and cooling a room are pretty straightforward:
//
// 1. Keep the room temperature between 65 and 75 degrees at all times.
// 2. If you want to heat the room, you need to turn on both the fan and the heater.
// 3. If you want to cool the room, you need to turn on both the fan and the cooler.
//
// Unfortunately, the realities of complex day-to-day development means there are a few quirks you need to think about as you write your code:
//
// - The thermostat has a lot of lag meaning that you can take an action once per minute. Any faster and it will explode.
// - After the heater is turned off, the fan stalls. You can’t turn on the fan for five minutes after the heat is turned off or it will explode.
// - After the cooler is turned off, the fan stalls. You can’t turn on the fan for three minutes after the cooler is turned off or it will explode.
// - It is dangerous to turn on the heater or cooler without the fan. They will explode...

class ExplosionError extends Error {
  constructor(msg) {
    super(msg);
    this.name = "ExplosionError";
  }
}

// do not edit this class directly!
// why? HVAC is the interface we are using - it is developed by another team
// (e.g.: this is what we will replace with test doubles)
class HVAC {
  constructor() {
    this.temp = 0;
    this.heat = false;
    this.cool = false;
    this.fan = false;
  }
}

// you will need to edit this class, as this is under our control
class Thermostat {
  constructor(hvac) {
    this.hvac = hvac;
  }

  tick() {
    throw new ExplosionError("oh no");
  }
}

module.exports = {
  HVAC,
  Thermostat,
  ExplosionError,
};
