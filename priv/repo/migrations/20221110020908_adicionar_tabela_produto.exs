defmodule Pizzaria.Repo.Migrations.AdicionarTabelaProduto do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string, null: false
      add :descricao, :string, null: false
      add :preco, :float, null: false

      timestamps()
    end
  end
end
