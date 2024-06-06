class UsuarioModel {

  final String? id;
  final String email;
  final String nome;
  final String senha;

  UsuarioModel({
    this.id,
    required this.nome,
    required this.email,
    required this.senha
  });
}