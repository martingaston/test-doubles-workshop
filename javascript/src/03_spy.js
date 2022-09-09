function adder(a, b, auditer) {
  const result = a + b;

  if (auditer) {
    auditer.record(result, Date.now());
  }

  return result;
}

module.exports = adder;
