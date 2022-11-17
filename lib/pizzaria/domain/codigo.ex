defmodule Pizzaria.Domain.Codigo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "codigos" do
    field(:codigo, :string)
    field(:porcentagem, :float, default: 0.0)
    field(:limite, :float, default: 0.0)

    timestamps()
  end

  @required_fields [:codigo, :porcentagem, :limite]

  def changeset(%__MODULE__{} = codigo \\ %__MODULE__{}, attrs) do
    codigo
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

  def retorna() do
    {:ok, %__MODULE__{}}
  end
end
