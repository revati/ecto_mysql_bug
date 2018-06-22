defmodule Bug.PrimaryModule do
  use Bug.Schema

  schema "primary_module" do
    field(:title, :string)
  end
end
