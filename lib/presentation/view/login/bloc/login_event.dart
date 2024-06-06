part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUsuarioEvent extends LoginEvent {
  final String email;
  final String senha;

  const LoginUsuarioEvent({
    required this.email,
    required this.senha,
  });

  @override
  List<Object?> get props => [email, senha];
}
