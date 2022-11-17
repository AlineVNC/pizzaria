defmodule Core.Adicional do
  @enforce_keys [:nome, :preco]
  defstruct(
    nome: nil,
    preco: nil
  )

  def criar_adicional(nome, preco) do
    %__MODULE__{
      nome: nome,
      preco: preco
    }
  end
end
