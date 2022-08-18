// we can say this function takes two parameters of type number and returns a number
function sum(a, b) {
  return a + b;
}

test("adds 1 + 2 to equal 3", () => {
  const result = sum(1, 2);

  expect(result).toBe(3);
});

// TDD
// 1. write a failing test                                 <---------
// 2. write the minimal amount of code required to get it to pass   |
// 3. refactor ------------------------------------------------------

// TODO: use TDD to create a subtraction function that takes two numbers, subtracts one from the other and returns the result
// ... look, I know it's a little hokey.

// TDD, part 2

// we want to write a function that prints the result of sum(123, 456) to the console
// e.g. console.log()... which has no return value
//
// 🤔 question: how do we test this?
