defmodule Core.Codigo do
  @enforce_keys [:codigo, :porcentagem, :limite]
  defstruct(
    codigo: nil,
    porcentagem: 0.0,
    limite: 0.0
  )

  def criar_codigo(codigo, porcentagem, limite) do
    %__MODULE__{
      codigo: codigo,
      porcentagem: porcentagem,
      limite: limite
    }
  end
end
