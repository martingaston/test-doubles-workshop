# Ruby 

This workshop uses the [Ruby](https://www.ruby-lang.org/en/) programming language because of its relative ease of use for the subject matter. You do not have to be a Ruby expert to participate, but _some_ knowledge of a dynamically typed language - e.g. JavaScript or Python - is probably essential.

Code will be annotated to hopefully make the syntax more straightforward to those coming from other languages. If you're in doubt, feel free to ask for clarification!

To simplify installation, this workshop will use [Docker Desktop](https://www.docker.com/products/docker-desktop/) to run a containerised environment. Shell commands will be given to follow that approach, but if you feel comfortable with Ruby (and have a local environment already setup) then please feel free to substitute with your own knowledge: `rake test` should have you sorted.

You can run the test suite with the following command. The `--no-log-prefix` is optional but does make reading the output easier.

```
$ docker compose up --no-log-prefix
```

By default, Docker will run all the test files. If you want to run only one of the test suites, you can send in an RACK_ENV environment variable:

```
$ RACK_ENV=test:warmup docker compose up --no-log-prefix
$ RACK_ENV=test:dummy docker compose up --no-log-prefix
$ RACK_ENV=test:stub docker compose up --no-log-prefix
$ RACK_ENV=test:spy docker compose up --no-log-prefix
$ RACK_ENV=test:mock docker compose up --no-log-prefix
$ RACK_ENV=test:fake docker compose up --no-log-prefix
```

When you're done with the workshop, the following command will tear down any remaining resources:

```
$ docker compose down
```

