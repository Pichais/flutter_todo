part of 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';

abstract class HomeEvent {}

class LoadTodoBloc extends HomeEvent {}

class LoadDoingBloc extends HomeEvent {}

class LoadDoneBloc extends HomeEvent {}

class LoadMoreDataBloc extends HomeEvent {
  String eventTosentAPI;
  LoadMoreDataBloc({required this.eventTosentAPI});
}

class ToDeleteDataBloc extends HomeEvent {
  String id;
  ToDeleteDataBloc({required this.id});
}
