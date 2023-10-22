defmodule PhilCollinsApi.Repo do
  use Ecto.Repo,
    otp_app: :phil_collins_api,
    adapter: Ecto.Adapters.Postgres
end
