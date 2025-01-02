import 'package:brsk_test_2/common/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/use_case.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoadingState());
    try {
      await useCase(params);
      emit(ButtonSuccessState());
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
