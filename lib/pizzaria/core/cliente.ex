defmodule Core.Cliente do
  @enforce_keys [:nome, :endereco, :telefone]
  defstruct(
    nome: nil,
    endereco: nil,
    telefone: nil
  )

  def criar_novo_cliente(nome, endereco, telefone) do
    %__MODULE__{
      nome: nome,
      endereco: endereco,
      telefone: telefone
    }
  end
end
