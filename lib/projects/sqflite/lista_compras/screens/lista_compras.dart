import 'package:flutter/material.dart';
import 'package:teste/projects/sqflite/lista_compras/models/produto.dart';
import 'package:teste/projects/sqflite/lista_compras/utils/produto_helpers.dart';

class ListaCompras extends StatefulWidget {
  const ListaCompras({super.key});

  @override
  State<ListaCompras> createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  var lista = [];

  ProdutoHelpers db = ProdutoHelpers();

  TextEditingController titleController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    carregaProduto();
    super.initState();
  }

  void carregaProduto() async {
    List<dynamic> produtos = await db.listarProdutos();
    setState(() {
      lista = produtos.map((e) => Produto.fromMap(e)).toList();
    });
  }

  void deletaProduto(id) async {
    await db.deletarProduto(id);
    carregaProduto();
  }

  void dialogDeletaItem(String id) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: const Text('Tem certeza que deseja deletar o item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Não'),
            ),
            ElevatedButton(
              onPressed: () {
                deletaProduto(id);
                setState(() {});
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text('Sim'),
            ),
          ],
        );
      }),
    );
  }

  void cadastraProduto() async {
    Produto obj = Produto(
      title: titleController.text,
      description: descricaoController.text,
      preco: double.parse(precoController.text),
    );

    int res = await db.cadastrarProduto(obj);

    debugPrint('cadastro realizado ${res.toString()}');
  }

  addProduct(context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Adicionar produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(label: Text('Produto')),
              ),
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(label: Text('Descriçao')),
              ),
              TextFormField(
                controller: precoController,
                decoration: const InputDecoration(label: Text('Preço')),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      lista.add(
                        Produto(
                          title: titleController.text,
                          description: descricaoController.text,
                          preco: double.parse(precoController.text),
                        ),
                      );
                      cadastraProduto();
                    });
                    titleController.text = '';
                    descricaoController.text = '';
                    precoController.text = '';
                    Navigator.pop(context);
                  },
                  child: const Text('Cadastrar'))
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de compras'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.separated(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.card_giftcard),
                    title: Text(lista[index].title.toString()),
                    subtitle: Text(lista[index].description.toString()),
                    trailing: Text(
                      '${lista[index].preco.toString()} R\$',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      dialogDeletaItem(lista[index].id);
                    })
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addProduct(context),
        child: const Text('+'),
      ),
    );
  }
}
