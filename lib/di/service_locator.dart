import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/firebase_auth_repository_impl.dart';
import '../domain/repositories/firebase_auth_repository.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<AuthRepository>(
        () => FirebaseAuthRepositoryImpl(getIt<FirebaseAuth>()),
  );
}
