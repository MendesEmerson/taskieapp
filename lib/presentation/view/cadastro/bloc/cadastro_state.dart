part of 'cadastro_bloc.dart';

sealed class CadastroState extends Equatable {
  const CadastroState();
}

final class CadastroInitial extends CadastroState {
  @override
  List<Object> get props => [];
}

class CadastroLoading extends CadastroState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CadastroSuccess extends CadastroState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CadastroFailure extends CadastroState {
  final String error;

  const CadastroFailure({required this.error});

  @override
  List<Object> get props => [error];
}
