import 'package:uuid/uuid.dart';

class Produto {
  String id = const Uuid().v4();
  String? title;
  String? description;
  double? preco;

  Produto({
    required this.title,
    required this.description,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    var dados = <String, dynamic>{};
    dados['id'] = id;
    dados['title'] = title;
    dados['description'] = description;
    dados['preco'] = preco;
    return dados;
  }

  Produto.fromMap(Map<String, dynamic> dados) {
    id = dados['id'] ?? '000';
    title = dados['title'];
    description = dados['description'];
    preco = dados['preco'];
  }
}
