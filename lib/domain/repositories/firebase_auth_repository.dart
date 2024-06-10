abstract class AuthRepository {

  Future<void> registerUser(String nome, String email, String senha);

  Future<void> loginUser(String email, String senha);

}