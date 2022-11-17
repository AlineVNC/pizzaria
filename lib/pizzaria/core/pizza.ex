defmodule Core.Pizza do
  @enforce_keys [:nome, :descricao, :preco, :tipo_de_borda]
  defstruct(
    nome: nil,
    descricao: nil,
    preco: nil,
    adicionais: [],
    tipo_de_borda: nil
  )

  def criar_pizza(nome, descricao, preco) do
    %__MODULE__{
      nome: nome,
      descricao: descricao,
      preco: preco,
      tipo_de_borda: Core.TipoDeBorda.criar_borda("Sem Borda", 0.0)
    }
  end

  def adicionar_adicional(pizza, adicional) do
    %{pizza | adicionais: [adicional | pizza.adicionais]}
  end

  def mudar_borda(pizza, nova_borda) do
    %{pizza | tipo_de_borda: nova_borda}
  end

  def calcula_preco(pizza) do
    total_adicionais =
      pizza.adicionais |> Enum.map(fn adicional -> adicional.preco end) |> Enum.sum()

    preco = pizza.preco + pizza.tipo_de_borda.preco + total_adicionais
    preco
  end
end
