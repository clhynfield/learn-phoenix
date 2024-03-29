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

## Testing outside-in

## Set up Wallaby

Add Wallaby to the list of dependencies in `mix.exs`:

```elixir
# mix.exs
def deps do
   # other deps
   {:plug_cowboy, "~> 2.7"},
   {:wallaby, "~> 0.30.6", [runtime: false, only: :test]}
  ]
end
```

And install it:

```shell-session
$ mix deps.get
…
* Getting cowboy (Hex package)
* Getting cowboy_telemetry (Hex package)
* Getting cowlib (Hex package)
* Getting ranch (Hex package)
You have added/upgraded packages you could sponsor, run `mix hex.sponsor` to learn more
$
```

To the test runner in `test/test_helper.exs`, add Wallaby and a base URL to resolve relative paths:

```elixir
# test/test_helper.exs
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Chatter.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, ChatterWeb.Endpoint.url())
```

Add a bunch more config according to [TDDPhoenix - Setting Up](https://www.tddphoenix.com/setting-up/)…

Then run the tests again and ensure they pass:

```shell-session
$ mix test
Generated chatter app
.....
Finished in 0.09 seconds (0.06s async, 0.03s sync)
5 tests, 0 failures

Randomized with seed 904575

$
```

## Create a `FeatureCase` helper module

https://www.tddphoenix.com/setting-up/#creating-a-featurecase-helper-module
