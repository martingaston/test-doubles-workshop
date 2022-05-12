# Test Doubles Workshop

## Introduction

"Test double" is an overarching (and debatably overloaded) term to define the action of replacing real/production code with a simplified _stand-in_ (like a stunt double in a movie) for the purposes of creating an automated test suite, predominantly within the object-oriented programming paradigm.

The term is credited as appearing first in Gerard Meszaros's [xUnit Test Patterns](http://xunitpatterns.com/).

A consensus has formed around various patterns for employing test doubles, creating the terms dummy, stub, spy, mock and fake. Collectively they make up a core component of outside-in test-driven development, add some exciting new possibilities in verifying _behaviour_ inside a test suite and eventually invite the user to participate in the red-hot debate of whether or not they should ever actually be used _at all_. 

It's also worth noting that the term mock - or _mocking library_ - has also become a catch-all term for test doubles in general, leading to numerous salty debates on pull request submissions. While there is probably some worthwhile nuance in the various terms, this workshop takes the opinion that it's (probably) not terminology worth sweating over at this point in time. 

### Workshop Structure

This workshop is designed to be interactive and collaborative, ideally working as a pair throughout the exercises. We'll be aiming for the following timings over 90 minutes: 

- Check-In (5m)
- Setup Environments (5m)
- Warmup (10m)
- Regroup (5m)
- Test Double Exercises (20m)
- Regroup (10m)
- HVAC Exercise (20m)
- Feedback (10m)

You are not expected to get through everything in that time, and will hopefully want to re-visit this workshop down the line to check-in.

### Goals

If this workshop does what it hopes to do, you'll finish up with the following:

- What we mean by terms test double, dummy, stub, spy, mock and fake.
- An understanding of why to use test doubles as part of your testing practice
- How test doubles enable outside-in test driven development
- Knowledge of where to go next to further your understanding of test doubles and outside-in test driven development 

### Prerequisites

- You should feel at worst _lightly_ comfortable with the classic style of TDD. You have probably attended an 'introduction to TDD' workshop, likely done a kata involving bowling or string calculating and written some tests for one of your own projects.
- You are not expected to be a devout TDD true believer. Some healthy scepticism is encouraged! 

### Setup

This workshop uses the [Ruby](https://www.ruby-lang.org/en/) programming language because of its relative ease of use for the subject matter. You do not have to be a Ruby expert to participate, but _some_ knowledge of a dynamically typed language - e.g. JavaScript or Python - is probably essential.

Code will be annotated to hopefully make the syntax more straightforward to those coming from other languages. If you're in doubt, feel free to ask for clarification!

To simplify installation, this workshop will use [Docker Desktop](https://www.docker.com/products/docker-desktop/) to run a containerised environment. Shell commands will be given to follow that approach, but if you feel comfortable with Ruby (and have a local environment already setup) then please feel free to substitute with your own knowledge: `rake test` should have you sorted.

You can run the test suite with the following command. The `--no-log-prefix` is optional but does make reading the output easier.

```
$ docker compose up --no-log-prefix
```

When you're done with the workshops, the following command will tear down any remaining resources:

```
$ docker compose down
```

As pairing is encouraged in this workshop, it also will be advantageous to have a setup that removes some of the barriers to collaborative editing. At time of writing, the [Live Share extension for VS Code](https://code.visualstudio.com/learn/collaboration/live-share) is perhaps the easiest way to get up and running here. 

## Warmup (ETA 10 Minutes)

#### ✨ It can feel awkward, but pair programming is encouraged ✨  

Take a look at `lib/00_warmup.rb` and `test/00_warmup_test.rb` to get yourself familiar with the syntax of Ruby, Minitest and the layout of the exercises today.

You may not find yourself being able to comfortably do all of this in 10 minutes, this is OK! The main goal of the warmup is to start our journey into test doubles, **not to pass the test suite**. 

## The Magic Of Dependency Injection

Before going into test doubles properly, it will almost certainly be advantageous to refresh our memories on dependency injection. 

### Dependency Injection, Why?

We work for a reasonably sized enterprise company that, above all else, adores paperwork. In the below example we have two classes, `Adder` and `Auditer`. `Adder` has an `add` method which will return the sum of input parameters `x` and `y`. As part of our compliance regulations, however, we require an auditable record of each addition: this is handled by the `Auditer` class and its `record` method. 

Unfortunately, `Adder#record` performs some _extremely_ complex computation and takes ~2 seconds to complete. 

```ruby
class Auditer
  def record(result, timestamp)
    sleep 2.seconds # do extremely complicated data engineering work
  end
end

class Adder
  def add(x, y)
    result = x + y

    Auditer.new.record(result, Time.now)

    result
  end
end
```

This is problematic for our unit testing for `Adder` because:

- Unit testing is supposed to be fast! 2 seconds is too long! 
- Our `Adder` class is now tightly coupled to our `Auditer` class.
- If our `Auditer` class was our concrete/production code then we might be adding test events to our actual, for-realsies audit log. Try explaining that to your compliance team. 

Instead, we can modify our design for `Adder` slightly to use dependency injection - instead of instantiating the class directly in our code, we now assign an object to an instance variable `@auditer`. Ruby is not at all worried about _what_ that object is, only that it can respond to a `record` message.

```ruby
# This is our production code - we don't need this for our unit test cases for Adder
class Auditer
  def record(result, timestamp)
    sleep 2.seconds
  end
end

# DoubleAuditer also responds to a record message
class DoubleAuditer
  def record(result, timestamp)
    # blank
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
```

This is known as duck typing and a is common trait to dynamic languages (e.g. Ruby, Python, JavaScript). Duck typing can take a while to get your head around, but is a very powerful technique in object-oriented design. 

In doing this, we have just experienced the use of a  _test double_. In our tests, `DoubleAuditer` stands in for `Auditer`. This can be an effective thing to do because:

- It allows us to focus our unit tests for `Adder` specifically on the behaviour of the `Adder` class. Two separate teams may even be working on `Adder` and `Auditer`, and this allows them to work in isolation.
- We knock out the actual dependencies and replace them with doubles, which allows our tests to focus solely on the actual subject under test (`Adder`). 
- It significantly speeds up our test suite, which your CI runner will thank you for.

## Test Double Exercises (ETA 20 Minutes)

> 🙋 There are many sophisticated mocking/test double libraries that simplify the process of creating and using doubles in your test suites. These libraries can often have their own intricacies and bespoke APIs, however, which can detract from process of actually getting familiar with test doubles. For this workshop please lovingly (for the most part) craft your test doubles by hand - this can be a really effective way of demystifying them! 

This repo contains a series of exercises designed to give you exposure to each test double, locaed in the `lib` and `test` folders. Counting up, try to move through each of the test files and make the failing tests pass.

#### 🎤 If you can, discuss how you might use each test double in your current project with your pair. For instance, how might a stub help you write tests for your Tic Tac Toe? How might a spy be useful for developing an Echo Server?

```
.
├── lib
│   ├── 00_warmup.rb
│   ├── 01_dummy.rb
│   ├── 02_stub.rb
│   ├── 03_spy.rb
│   ├── 04_mock.rb
│   └── 05_fake.rb
└── test
    ├── 00_warmup_test.rb
    ├── 01_dummy_test.rb <-- start here!
    ├── 02_stub_test.rb
    ├── 03_spy_test.rb
    ├── 04_mock_test.rb
    └── 05_fake_test.rb
```

#### 🤔 Try to give yourself 3-4 minutes with each test suite and move on. Do not worry if you cannot get the tests to pass!  


## Feedback
Please take a moment to provide feedback on the workshop: 
https://forms.gle/LLgkMWeaUKPk6cHP8

PRs and content suggestions are very much welcome, also.

## Further Resources

### Books
- [Growing Object Oriented Software, Guided by Tests](http://www.growing-object-oriented-software.com/) (lovingly referred to as GOOS) is the seminal text detailing the use of test doubles within outside-in test driven development.

### Talks
- [How to stop hating your tests](https://youtu.be/URSWYvyc42M)
- [Please Don't mock me](https://blog.testdouble.com/talks/2018-03-06-please-dont-mock-me/)

### Blog Posts
- [XUnit Patterns - Mocks, Fakes, Stubs and Dummies](http://xunitpatterns.com/Mocks,%20Fakes,%20Stubs%20and%20Dummies.html)
- [That's Not Yours](https://8thlight.com/blog/eric-smith/2011/10/27/thats-not-yours.html)
