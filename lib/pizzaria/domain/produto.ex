defmodule Pizzaria.Domain.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field(:nome, :string)
    field(:descricao, :string)
    field(:preco, :float, default: 0.0)

    timestamps()
  end

  @required_fields [:nome, :descricao, :preco]
  def changeset(%__MODULE__{} = produto \\ %__MODULE__{}, attrs) do
    produto
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
