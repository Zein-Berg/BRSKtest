import 'package:brsk_test_2/core/use_case.dart';
import 'package:brsk_test_2/feature/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  @override
  Future<UserEntity> call(SignUpParams? params) async {
    return await authRepository.signUp(
      email: params!.email,
      password: params.password,
      name: params.name!,
      photoURL: params.avatarImage,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String? name;
  final String? avatarImage;

  const SignUpParams({
    required this.email,
    required this.password,
    this.name,
    this.avatarImage,
  });

  @override
  List<Object?> get props => [email, password, name, avatarImage];
}
