import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/firebase_auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthRepository firebaseAuthRepository;

  LoginBloc({required this.firebaseAuthRepository}) : super(LoginInitial()) {
    on<LoginUsuarioEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await firebaseAuthRepository.logarUsuario(event.email, event.senha);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
