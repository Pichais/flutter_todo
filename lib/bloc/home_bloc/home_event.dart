part of 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';

abstract class HomeEvent {}

class LoadTodoBloc extends HomeEvent {}

class LoadDoingBloc extends HomeEvent {}

class LoadDoneBloc extends HomeEvent {}

class LoadMoreDataBloc extends HomeEvent {}