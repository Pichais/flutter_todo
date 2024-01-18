import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitailState()) {
    on<AddPinCode>(_onAddPin);
  }

  FutureOr<void> _onAddPin(AddPinCode event, Emitter<LoginState> emit) {

    if (event.pinCode == 'clear') {
      emit(UpdatePinstate(pinCode: ''));
    } else {
      String updatedPinCode = state.pinCode + event.pinCode;
      if (updatedPinCode.length <= 6) {
        emit(UpdatePinstate(pinCode: updatedPinCode));
      }
    }
  }
}
