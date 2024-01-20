defmodule PhilCollinsApi.Albums.Album do
  use Ecto.Schema
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
    |> cast(attrs, [:title, :image, :release_date, :is_lp])
    |> validate_required([:title, :image, :release_date, :is_lp])
  end
end
