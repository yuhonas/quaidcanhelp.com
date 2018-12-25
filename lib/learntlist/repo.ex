defmodule Learntlist.Repo do
  use Ecto.Repo,
    otp_app: :learntlist,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
