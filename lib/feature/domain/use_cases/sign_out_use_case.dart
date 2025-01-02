import 'package:brsk_test_2/core/use_case.dart';
import 'package:brsk_test_2/feature/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../repositories/auth_repository.dart';

class SignOutUseCase implements UseCase<UserEntity, SignOutParams> {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  @override
  Future<UserEntity> call(SignOutParams? params) async {
    try {
      await authRepository.signOut();
      return UserEntity.empty;
    } catch (error) {
      throw Exception('Exception while SignOutUseCase: $error');
    }
  }
}

class SignOutParams extends Equatable {
  @override
  List<Object?> get props => [];
}
