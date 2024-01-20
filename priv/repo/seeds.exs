alias PhilCollinsApi.Repo
alias PhilCollinsApi.Api.V1.Album

# Limpar todos os registros existentes antes de adicionar novos
Repo.transaction(fn ->
  Repo.delete_all(Album)
end)

# Adicionar registros iniciais
albums_data = [
  %{
    title: "No Jacket Required",
    release_date: ~D[1985-02-18],
    is_lp: true,
    image: "no_jacket_required.jpg"
  },
  %{
    title: "Invisible Touch",
    release_date: ~D[1986-06-06],
    is_lp: true,
    image: "invisible_touch.jpg"
  },
  %{title: "Face Value", release_date: ~D[1981-02-09], is_lp: true, image: "face_value.jpg"}
]

Enum.each(albums_data, fn album_attrs ->
  %Album{}
  |> Album.changeset(album_attrs)
  |> Repo.insert()
end)

IO.puts("Dados de seed adicionados com sucesso!")
