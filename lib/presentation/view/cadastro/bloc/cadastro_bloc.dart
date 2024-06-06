import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/usuario_model.dart';
import '../../../../domain/repositories/firebase_auth_repository.dart';

part 'cadastro_event.dart';

part 'cadastro_state.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  final FirebaseAuthRepository firebaseAuthRepository;

  CadastroBloc({required this.firebaseAuthRepository})
      : super(CadastroInitial()) {
    on<CadastrarUsuarioEvent>((event, emit) async {
      emit(CadastroLoading());
      try {
        await firebaseAuthRepository.cadastrarUsuario(
            event.nome, event.email, event.senha);
        emit(CadastroSuccess());
      } catch (e) {
        print("ERRO LOGGER ${e.toString()}");
        emit(CadastroFailure(error: e.toString()));
      }
    });
  }
}
