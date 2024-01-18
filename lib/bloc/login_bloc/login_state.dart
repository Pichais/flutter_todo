// ignore_for_file: must_be_immutable

part of 'package:flutter_todo/bloc/login_bloc/login_bloc.dart';

class LoginState extends Equatable {
  String pinCode;

  LoginState({required this.pinCode});
  List<Object?> get props => [pinCode];
}

class InitailState extends LoginState {
  InitailState() : super(pinCode: '');
}

class UpdatePinstate extends LoginState{
  UpdatePinstate({required String pinCode}) : super(pinCode: pinCode);
}
