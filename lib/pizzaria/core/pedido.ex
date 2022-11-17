defmodule Core.Pedido do
  @enforce_keys [:cliente]
  defstruct(
    itens: [],
    pizzas: [],
    cliente: nil
  )

  def criar_pedido(cliente) do
    %__MODULE__{
      cliente: cliente
    }
  end

  def adicionar_item(pedido, item) do
    itens_do_pedido = pedido.itens
    itens_atualizados = [item | itens_do_pedido]
    %{pedido | itens: itens_atualizados}
  end

  def adicionar_pizza(pedido, pizza) do
    pizzas_do_pedido = pedido.pizzas
    pizzas_atualizadas = [pizza | pizzas_do_pedido]
    %{pedido | pizzas: pizzas_atualizadas}
  end

  def calcular_total(pedido) do
    total_pizza =
      pedido.pizzas |> Enum.map(fn pizza -> Core.Pizza.calcula_preco(pizza) end) |> Enum.sum()

    total_itens =
      pedido.itens |> Enum.map(fn item -> Core.Item.calcula_total(item) end) |> Enum.sum()

    total_pizza + total_itens
  end
end
