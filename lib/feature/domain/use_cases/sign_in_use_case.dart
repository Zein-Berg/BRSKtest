import 'package:brsk_test_2/core/use_case.dart';
import 'package:brsk_test_2/feature/domain/entities/user_entity.dart';
import 'package:brsk_test_2/feature/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  @override
  Future<UserEntity> call(SignInParams? params) async {
    return await authRepository.signIn(
      email: params!.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
