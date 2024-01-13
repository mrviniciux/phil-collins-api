defmodule PhilCollinsApi.Api.V1.Album do
  use Ecto.Schema
  import Ecto.Query, warn: false
  import Ecto.Changeset

  schema "albums" do
    field :title, :string
    field :image, :string
    field :release_date, :date
    field :is_lp, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:title, :release_date, :is_lp, :image])
    |> validate_required([:title, :release_date, :is_lp, :image])
  end
end
