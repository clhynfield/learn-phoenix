# Learn Phoenix

## Installation

First install Hex:

```shell-session
$ mix local.hex
```

Then install Phoenix:

```shell-session
$ mix archive.install hex phx_new
```

## Create a new project

Phoenix defaults to Postgres, but we'll use SQLite for this exercise:

```shell-session
$ mix phx.new chatter --database sqlite3
…
Fetch and install dependencies? [Yn]
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd chatter

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
$ cd chatter
$ mix ecto.create
```

## Test the new project

```shell-session
$ cd chatter
$ mix test
…
==> chatter
Compiling 17 files (.ex)
Generated chatter app

23:35:07.647 [error] Exqlite.Connection (#PID<0.5370.0>) failed to connect: ** (Exqlite.Error) database is locked
.....
Finished in 0.01 seconds (0.01s async, 0.00s sync)
5 tests, 0 failures

Randomized with seed 724817
```
