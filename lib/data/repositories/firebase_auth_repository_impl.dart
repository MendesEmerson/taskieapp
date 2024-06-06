import 'package:taskieapp/domain/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/error/firebase_auth_error_handler.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> cadastrarUsuario(String nome, String email, String senha) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      FirebaseAuthErrorHandler.handleFirebaseAuthException(e);
    } catch (e) {
      FirebaseAuthErrorHandler.handleGenericException(e);
    }
  }

  @override
  Future<void> logarUsuario(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      FirebaseAuthErrorHandler.handleFirebaseAuthException(e);
    } catch (e) {
      FirebaseAuthErrorHandler.handleGenericException(e);
    }
  }
}
