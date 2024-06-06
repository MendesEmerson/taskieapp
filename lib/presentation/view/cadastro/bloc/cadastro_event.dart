part of 'cadastro_bloc.dart';

sealed class CadastroEvent extends Equatable {
  const CadastroEvent();
}

class CadastrarUsuarioEvent extends CadastroEvent {
  final String nome;
  final String email;
  final String senha;

  const CadastrarUsuarioEvent({
    required this.nome,
    required this.email,
    required this.senha,
  });


  @override
  List<Object?> get props => [nome, email, senha];
}
