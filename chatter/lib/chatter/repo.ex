defmodule Chatter.Repo do
  use Ecto.Repo,
    otp_app: :chatter,
    adapter: Ecto.Adapters.SQLite3
end
