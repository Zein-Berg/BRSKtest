import 'package:brsk_test_2/core/use_case.dart';
import 'package:equatable/equatable.dart';

import '../repositories/auth_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, IsLoggedInParams> {
  final AuthRepository authRepository;

  IsLoggedInUseCase({required this.authRepository});

  @override
  Future<bool> call(params) async {
    return await authRepository.isLoggedIn();
  }
}

class IsLoggedInParams extends Equatable {
  @override
  List<Object?> get props => [];
}
