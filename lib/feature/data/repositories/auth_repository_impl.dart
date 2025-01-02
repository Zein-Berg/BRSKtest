import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
    String? photoURL,
  }) async {
    final user = await remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      photoURL: photoURL,
    );
    return user;
  }

  @override
  Future<bool> isLoggedIn() async {
    return await remoteDataSource.isLoggedIn();
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }
}
