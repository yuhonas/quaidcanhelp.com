# This is an example database.secret.exs
#
# Copy this file to database.secret.exs and modify the credentials accordingly
# the copied file should NOT be checked into version control

use Mix.Config

config :quaidcanhelp, Quaidcanhelp.Repo,
  username: "postgres",
  password: "",
  hostname: "localhost",
  pool_size: 10

