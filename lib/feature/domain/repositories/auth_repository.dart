import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
    String? photoURL,
  });
  Future<void> signOut();
  Future<bool> isLoggedIn();
}
