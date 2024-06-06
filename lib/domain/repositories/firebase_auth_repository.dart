abstract class FirebaseAuthRepository {

  Future<void> cadastrarUsuario(String nome, String email, String senha);

  Future<void> logarUsuario(String email, String senha);

}