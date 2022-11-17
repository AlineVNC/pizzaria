defmodule Core.TipoDeBorda do
  @enforce_keys [:nome, :preco]
  defstruct(
    nome: nil,
    preco: nil
  )

  def criar_borda(nome, preco) do
    %__MODULE__{
      nome: nome,
      preco: preco
    }
  end
end
