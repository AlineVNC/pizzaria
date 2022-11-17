defmodule Pizzaria do
  def iniciar() do
    estado = %{
      pizzas: %{
        sequencia: 1,
        lista: %{
          1 => %Core.Pizza{
            adicionais: [%Core.Adicional{nome: "azeitona", preco: 1.0}],
            descricao: "calabresa, cebola, queijo",
            nome: "calabresa",
            preco: 15.0,
            tipo_de_borda: %Core.TipoDeBorda{nome: "chocolate", preco: 5.0}
          }
        }
      },
      clientes: %{
        sequencia: 0,
        lista: %{}
      },
      adicionais: %{
        sequencia: 0,
        lista: %{}
      },
      bordas: %{
        sequencia: 0,
        lista: %{}
      },
      pedidos: %{
        sequencia: 0,
        lista: %{}
      },
      codigos: %{
        sequencia: 0,
        lista: %{}
      }
    }

    rodar_aplicacao(estado)
  end

  def rodar_aplicacao(estado) do
    [IO.ANSI.clear(), IO.ANSI.cursor(0, 0)]
    |> IO.write()

    mostrar_boas_vindas()

    IO.inspect(estado)

    mostrar_menu()
    escolha = pegar_entrada("> ")

    estado_atualizado = processa_escolha(estado, escolha)

    rodar_aplicacao(estado_atualizado)
  end

  def processa_escolha(estado, "C") do
    IO.puts("CADASTRO DE CLIENTE")
    nome = pegar_entrada("Nome do cliente: ")
    telefone = pegar_entrada("Telefone: ")
    rua = pegar_entrada("Rua: ")
    numero = pegar_entrada("Numero: ")
    tipo = pegar_entrada("Tipo de moradia: ")
    complemento = pegar_entrada("Complemento: ")
    cep = pegar_entrada("CEP: ")

    endereco = Core.Endereco.criar_endereco(rua, numero, cep, tipo, complemento)
    cliente = Core.Cliente.criar_novo_cliente(nome, endereco, telefone)

    id = estado.clientes.sequencia + 1
    lista_clientes = estado.clientes.lista

    lista_clientes_atualizada = Map.put(lista_clientes, id, cliente)

    clientes = estado.clientes
    clientes = Map.put(clientes, :sequencia, id)
    clientes = Map.put(clientes, :lista, lista_clientes_atualizada)

    novo_estado = Map.put(estado, :clientes, clientes)

    novo_estado
  end

  def processa_escolha(estado, "A") do
    IO.puts("CADASTRAR UM ADICIONAL")
    nome = pegar_entrada("Nome do adicional: ")
    preco = pegar_entrada("Preço do adicional: ") |> String.to_float()

    adicional = Core.Adicional.criar_adicional(nome, preco)

    id = estado.adicionais.sequencia + 1
    # %{}
    lista_adicionais = estado.adicionais.lista

    # %{1 => %Core.Adicional{nome: "", preco: 0.0}, 2 => %Core.Adicional{nome: "", preco: 0.0}}
    lista_adicionais_atualizada = Map.put(lista_adicionais, id, adicional)

    # adicionais: %{sequencia: 1, lista: %{1 => %Core.Adicional{nome: "", preco: 0.0}}
    adicionais = estado.adicionais
    adicionais = Map.put(adicionais, :sequencia, id)
    adicionais = Map.put(adicionais, :lista, lista_adicionais_atualizada)

    novo_estado = Map.put(estado, :adicionais, adicionais)

    novo_estado
  end

  def processa_escolha(estado, "P") do
    IO.puts("CADASTRAR UM PRODUTO")
    nome = pegar_entrada("Nome do produto: ")
    descricao = pegar_entrada("Descricao do produto: ")
    preco = pegar_entrada("Preco do produto: ") |> String.to_float()

    produto = Core.Produto.criar_produto(nome, descricao, preco)

    Pizzaria.Repository.cadastrar_produto(produto)

    estado
  end

  def processa_escolha(estado, "B") do
    IO.puts("CADASTRAR UM TIPO DE BORDA")
    nome = pegar_entrada("Nome do tipo de borda: ")
    preco = pegar_entrada("preco do tipo de borda: ") |> String.to_float()

    borda = Core.TipoDeBorda.criar_borda(nome, preco)

    id = estado.bordas.sequencia + 1

    lista_bordas = estado.bordas.lista

    lista_borda_atualizada = Map.put(lista_bordas, id, borda)

    bordas = Map.put(estado.bordas, :sequencia, id)
    bordas = Map.put(bordas, :lista, lista_borda_atualizada)

    novo_estado = Map.put(estado, :bordas, bordas)

    novo_estado
  end

  def processa_escolha(estado, "O") do
    IO.puts("CADASTRAR CODIGO")
    codigo = pegar_entrada("Digite o codigo promocional: ")
    porcentagem = pegar_entrada("Informe o valor do desconto: ") |> String.to_float()
    limite = pegar_entrada("Informe o limite do desconto: ") |> String.to_float()

    codigo = Core.Codigo.criar_codigo(codigo, porcentagem, limite)

    id = estado.codigos.sequencia + 1

    lista_codigo = estado.codigos.lista

    lista_codigo_atualizada = Map.put(lista_codigo, id, codigo)

    codigos = Map.put(estado.codigos, :sequencia, id)
    codigos = Map.put(codigos, :lista, lista_codigo_atualizada)

    novo_estado = Map.put(estado, :codigos, codigos)

    novo_estado
  end

  def processa_escolha(estado, "I") do
    IO.puts("CADASTRAR PIZZA")
    nome = pegar_entrada("Informe o nome da pizza: ")
    descricao = pegar_entrada("Informe a descricao: ")
    preco = pegar_entrada("Informe o preco da pizza: ") |> String.to_float()

    pizza = Core.Pizza.criar_pizza(nome, descricao, preco)

    id = estado.pizzas.sequencia(+1)

    lista_pizza = estado.pizza.lista

    lista_pizza_atualizada = Map.put(lista_pizza, id, pizza)

    pizzas = Map.put(estado.pizzas, :sequencia, id)
    pizzas = Map.put(pizzas, :lista, lista_pizza_atualizada)

    novo_estado = Map.put(estado, :pizzas, pizzas)

    novo_estado
  end

  def processa_escolha(estado, "E") do
    IO.puts("Criar Pedidos")
  end

  def processa_escolha(estado, _uyg) do
    IO.puts("OPCAO INVALIDA!")
    IO.puts("Aperte Enter para continuar...")
    pegar_entrada("")
    estado
  end

  def mostrar_boas_vindas(), do: IO.puts("Bem vindo a pizzaria da Aline!")

  def mostrar_menu() do
    IO.puts("Escolha uma das opções abaixo: ")
    IO.puts("Cadastrar um (C)liente")
    IO.puts("Cadastrar um (A)dicional")
    IO.puts("Cadastrar um (P)roduto")
    IO.puts("Cadastrar um (B)orda")
    IO.puts("Cadastrar um P(I)zza")
    IO.puts("Criar P(E)dido")
  end

  def pegar_entrada(prompt) do
    [opcao | _] = IO.gets(prompt) |> String.split()
    opcao
  end

  def pega_cliente(estado, id) do
    Map.get(estado.clientes.lista, id)
  end

  def pega_pizza(estado, id) do
    Map.get(estado.pizzas.lista, id)
  end

  def pega_adicional(estado, id) do
    Map.get(estado.adicionais.lista, id)
  end

  def pega_borda(estado, id) do
    Map.get(estado.bordas.lista, id)
  end

  def pega_codigos(estado, id) do
    Map.get(estado.codigos.lista, id)
  end

  def pega_pedidos(estado, id) do
    Map.get(estado.pedidos.lista, id)
  end

  def pega_produtos(estado, id) do
    Map.get(estado.produtos.lista, id)
  end
end
