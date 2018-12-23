defmodule Learntlist.Repo do
  use Ecto.Repo,
    otp_app: :learntlist,
    adapter: Ecto.Adapters.Postgres
end
