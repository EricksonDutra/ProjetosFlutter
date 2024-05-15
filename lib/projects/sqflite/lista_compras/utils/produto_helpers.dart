import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/projects/sqflite/lista_compras/models/produto.dart';

class ProdutoHelpers {
  static Database? _database;
  static ProdutoHelpers? _databasehelper;

  ProdutoHelpers._createInstance();

  factory ProdutoHelpers() {
    _databasehelper ??= ProdutoHelpers._createInstance();
    return _databasehelper!;
  }

  String nameTab = 'tb_produtos';

  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPreco = 'preco';

  void _createDB(Database db, int version) async {
    String sql = '''
      CREATE TABLE $nameTab(
        $colId TEXT PRIMARY KEY,
        $colTitle TEXT,
        $colDescription TEXT,
        $colPreco FLOAT
      )
    ''';
    await db.execute(sql);
  }

  Future<Database> initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/$nameTab.db';

    var db = await openDatabase(path, version: 1, onCreate: _createDB);

    return db;
  }

  Future<Database> get database async {
    _database ??= await initializeDB();

    return _database!;
  }

  Future<int> cadastrarProduto(Produto obj) async {
    Database db = await database;

    var resposta = await db.insert(nameTab, obj.toMap());

    return resposta;
  }

  listarProdutos() async {
    final db = await database;

    String sql = "select * from $nameTab";
    List lista = await db.rawQuery(sql);
    if (lista.isEmpty) return [];

    return lista;
  }

  alterarProduto(Produto obj) async {
    final db = await database;

    var res = await db.update(nameTab, obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);

    return res;
  }

  deletarProduto(String id) async {
    final db = await database;

    final res = await db.delete(nameTab, where: 'id = ?', whereArgs: [id]);

    return res;
  }
}
