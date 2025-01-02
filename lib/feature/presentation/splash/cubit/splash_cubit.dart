import 'package:brsk_test_2/feature/domain/use_cases/is_logged_in_use_case.dart';
import 'package:brsk_test_2/feature/presentation/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsLoggedInUseCase isLoggedInUseCase;

  SplashCubit({required this.isLoggedInUseCase}) : super(DisplaySplash());

  void appStarted() async {
    if (await isLoggedInUseCase(null)) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }
}
