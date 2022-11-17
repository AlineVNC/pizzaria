defmodule Core.Item do
  @enforce_keys [:produto, :quantidade]
  defstruct(
    produto: nil,
    quantidade: 0
  )

  def criar_item(produto, quantidade) do
    %__MODULE__{
      produto: produto,
      quantidade: quantidade
    }
  end

  def calcula_total(item) do
    item.produto.preco * item.quantidade
  end
end
