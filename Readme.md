# mruby

## Unofficial docker image for mruby development

### How to build?:

    docker build . -t mruby:<tag>

**Example:**

    docker build . -t mruby:1.4.1

### How to run?:

    docker run -it mruby:1.4.1 <command>

**Example:**

    docker run -it mruby:1.4.1 bash

In absence of `command` it defaults to `mirb`
