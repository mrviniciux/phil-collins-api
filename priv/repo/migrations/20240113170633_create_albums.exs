defmodule PhilCollinsApi.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :release_date, :date
      add :is_lp, :boolean
      add :image, :string

      timestamps()
    end
  end
end
