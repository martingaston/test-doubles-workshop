# Test Doubles Workshop

## Introduction

"Test double" is an overarching (and debatably overloaded) term to define the action of replacing real/production code with a simplified _stand-in_ (like a stunt double in a movie) for the purposes of creating an automated test suite, predominantly within the object-oriented programming paradigm.

The term is credited as appearing first in Gerard Meszaros's [xUnit Test Patterns](http://xunitpatterns.com/).

A consensus has formed around various patterns for employing test doubles, creating the terms dummy, stub, spy, mock and fake. Collectively they make up a core component of outside-in test-driven development, add some exciting new possibilities in verifying _behaviour_ inside a test suite and eventually invite the user to participate in the red-hot debate of whether or not they should ever actually be used _at all_. 

It's also worth noting that the term mock - or _mocking library_ - has also become a catch-all term for test doubles in general, leading to numerous salty debates on pull request submissions. While there is probably some worthwhile nuance in the various terms, this workshop takes the opinion that it's (probably) not terminology worth sweating over at this point in time. 

### Workshop Structure

This workshop is designed to be interactive and collaborative, ideally working as a pair throughout the exercises. We'll be aiming for the following timings: 

- Check-In (5m)
- Setup Environments (5m)
- Warmup (10m)
- Test Double Exercises (20m)
- Regroup (10m)
- HVAC Exercise (20m)
- Feedback (10m)

You are not expected to get through everything in that time, and will hopefully want to re-visit this workshop down the line.

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

## Further Resources

- http://www.growing-object-oriented-software.com/
- http://xunitpatterns.com/Mocks,%20Fakes,%20Stubs%20and%20Dummies.html
- https://youtu.be/URSWYvyc42M
- https://blog.testdouble.com/talks/2018-03-06-please-dont-mock-me/