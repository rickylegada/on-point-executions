

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void togglePinPad() {
    emit(state.copyWith(showPinPad: true));
  }

  void addPin(String digit) {
    if (state.pin.length < 4) {
      emit(state.copyWith(pin: [...state.pin, digit]));
    }
    if(state.pin.length == 4){
      emit(state.copyWith(isPinCodeSuccess: true));
    }
  }

  void removePin() {
    if (state.pin.isNotEmpty) {
      emit(state.copyWith(pin: state.pin.sublist(0, state.pin.length - 1)));
    }
  }
}
