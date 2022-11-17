defmodule Pizzaria.Repository do
  alias Pizzaria.Domain

  def cadastrar_produto(%Core.Produto{} = produto) do
    produto
    |> Map.from_struct()
    |> Domain.Produto.changeset()
    |> Pizzaria.Repo.insert()
  end

  def pega_produto_por_id(id) do
    Pizzaria.Repo.get(Domain.Produto, id)
  end
end
