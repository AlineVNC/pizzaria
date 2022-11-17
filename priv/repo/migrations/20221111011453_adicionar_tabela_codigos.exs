defmodule Pizzaria.Repo.Migrations.AdicionarTabelaCodigos do
  use Ecto.Migration

  def change do
    create table(:codigos) do
      add :codigo, :string, null: false
      add :porcentagem, :float, null: false
      add :limite, :float, null: false

      timestamps()
    end
  end
end
