
part of 'package:flutter_todo/bloc/login_bloc/login_bloc.dart';

abstract class LoginEvent {}

class AddPinCode extends LoginEvent {
  String pinCode;

  AddPinCode({required this.pinCode});
}

class ClearPinCode extends LoginEvent {}
