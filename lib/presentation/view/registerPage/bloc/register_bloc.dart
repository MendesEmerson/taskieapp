

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/firebase_auth_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository firebaseAuthRepository;

  RegisterBloc({required this.firebaseAuthRepository})
      : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await firebaseAuthRepository.registerUser(
            event.name, event.email, event.password);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
