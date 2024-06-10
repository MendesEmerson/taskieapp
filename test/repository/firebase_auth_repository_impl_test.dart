import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskieapp/data/repositories/firebase_auth_repository_impl.dart';
import 'package:taskieapp/domain/repositories/firebase_auth_repository.dart';

import '../mocks/firebase/firebase_auth_mock.dart';
import '../mocks/firebase/firebase_auth_mock.mocks.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthRepository repository;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    repository = FirebaseAuthRepositoryImpl(mockFirebaseAuth);
  });

  group('FirebaseAuthRepositoryImpl', () {

    const email = 'test@example.com';
    const password = 'password123';

    test('Ao passar um email e senha validos deve criar um usuario e verificar se o metodo foi chamado', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).thenAnswer((_) async => MockUserCredential());

      await repository.registerUser('Test User', email, password);

      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).called(1);
    });

    test('Ao tentar criar um novo usuario com um email já cadastrado, deve retornar erro de email já cadastrado', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      expect(
            () => repository.registerUser('Test User', email, password),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('logarUsuario - success', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenAnswer((_) async => MockUserCredential());

      await repository.loginUser(email, password);

      verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).called(1);
    });

    test('logarUsuario - failure', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'wrong-password'));

      expect(
            () => repository.loginUser(email, password),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
