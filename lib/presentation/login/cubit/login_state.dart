class LoginState {
  final bool showPinPad;
  final List<String> pin;
  final bool isPinCodeSuccess;

  LoginState({this.showPinPad = false,this.isPinCodeSuccess = false, this.pin = const []});

  LoginState copyWith({bool? showPinPad, List<String>? pin, bool? isPinCodeSuccess}) {
    return LoginState(
      showPinPad: showPinPad ?? this.showPinPad,
      pin: pin ?? this.pin,
      isPinCodeSuccess: isPinCodeSuccess ?? this.isPinCodeSuccess,
    );
  }
}