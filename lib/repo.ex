defmodule Bug.Repo do
  use Ecto.Repo,
    otp_app: :bug,
    adapter: Ecto.Adapters.MySQL
end
