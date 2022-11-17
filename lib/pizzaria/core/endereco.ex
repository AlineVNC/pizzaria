defmodule Core.Endereco do
  @enforce_keys [:rua, :numero, :cep, :tipo, :complemento]
  defstruct(
    rua: nil,
    numero: nil,
    cep: nil,
    tipo: nil,
    complemento: nil
  )

  def criar_endereco(rua, numero, cep, tipo, complemento) do
    %__MODULE__{
      rua: rua,
      numero: numero,
      cep: cep,
      tipo: tipo,
      complemento: complemento
    }
  end
end
