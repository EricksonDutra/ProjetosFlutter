// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
  String? _nome;
  String? _email;
  String? _senha;

  Users();

  String get nome => _nome!;
  String get email => _email!;
  String get senha => _senha!;

  set nome(value) => _nome = value;
  set email(value) => _email = value;
  set senha(value) => _senha = value;
}
