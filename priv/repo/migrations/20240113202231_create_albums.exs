defmodule PhilCollinsApi.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :release_date, :date
      add :is_lp, :boolean, default: false, null: false
      add :image, :string

      timestamps(type: :utc_datetime)
    end
  end
end
