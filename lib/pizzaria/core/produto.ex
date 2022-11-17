defmodule Core.Produto do
  @enforce_keys [:nome, :descricao, :preco]
  defstruct(
    nome: nil,
    descricao: nil,
    preco: nil
  )

  def criar_produto(nome, descricao, preco) do
    %__MODULE__{
      nome: nome,
      descricao: descricao,
      preco: preco
    }
  end
end
