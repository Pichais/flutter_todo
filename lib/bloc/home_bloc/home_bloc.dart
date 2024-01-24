import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/services/todolist_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, Homestate> {
  bool isLoading = false;
  int offset = 0;
  HomeBloc() : super(InitailState()) {
    on<LoadTodoBloc>(_onLoadTodoData);
    on<LoadDoingBloc>(_onLoadDoingData);
    on<LoadDoneBloc>(_onLoadDoneData);
    on<LoadMoreDataBloc>(_onLoadMoreData);
    on<ToDeleteDataBloc>(_onDeleteBloc);
  }

  FutureOr<void> _onLoadTodoData(
      LoadTodoBloc event, Emitter<Homestate> emit) async {
    offset = 0;
    try {
      var response =
          await TodoService().fetchTodos(status: "TODO", offset: offset);
      TodoModel todoModel = TodoModel.fromJson(response);
      emit(FinishState(
        tasks: todoModel.tasks!,
        pageNumber: todoModel.pageNumber!,
        totalPages: todoModel.totalPages!,
      ));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> _onLoadDoingData(
      LoadDoingBloc event, Emitter<Homestate> emit) async {
    offset = 0;
    try {
      var response =
          await TodoService().fetchTodos(status: "DOING", offset: offset);
      TodoModel todoModel = TodoModel.fromJson(response);
      emit(FinishState(
        tasks: todoModel.tasks!,
        pageNumber: todoModel.pageNumber!,
        totalPages: todoModel.totalPages!,
      ));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> _onLoadDoneData(
      LoadDoneBloc event, Emitter<Homestate> emit) async {
    offset = 0;
    try {
      var response =
          await TodoService().fetchTodos(status: "DONE", offset: offset);
      TodoModel todoModel = TodoModel.fromJson(response);
      emit(FinishState(
        tasks: todoModel.tasks!,
        pageNumber: todoModel.pageNumber!,
        totalPages: todoModel.totalPages!,
      ));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> _onLoadMoreData(
      LoadMoreDataBloc event, Emitter<Homestate> emit) async {
    var currentState = state as FinishState;
    if (isLoading) return; // หยุดไม่ให้โหลดข้อมูลเมื่อกำลังโหลดอยู่แล้ว
    isLoading = true;
    if (state is FinishState) {
      if (offset == 0) {
        offset += 1;
      }
      try {
        var newData = await TodoService()
            .fetchTodos(status: event.eventTosentAPI, offset: offset);
        TodoModel newModel = TodoModel.fromJson(newData);
        if (newModel.tasks != null && newModel.tasks!.isNotEmpty) {
          offset++;
          List<Tasks> updatedTasks = List.from(currentState.tasks)
            ..addAll(newModel.tasks ?? []);
          emit(
            currentState.copyWith(
              tasks: updatedTasks,
              pageNumber: newModel.pageNumber,
              totalPages: newModel.totalPages,
            ),
          );
        }
      } catch (e) {
        emit(ErrorState());
      } finally {
        isLoading = false;
      }
    }
  }

  FutureOr<void> _onDeleteBloc(
      ToDeleteDataBloc event, Emitter<Homestate> emit) {
        if(state is FinishState){
          List<Tasks>  newListTasks = [];
          var currentState = state as FinishState;
          currentState.tasks.forEach((element) { 
            if(event.id != element.id){
              newListTasks.add(element);
            }
          });
          emit(currentState.copyWith(tasks: newListTasks));
        }
      }
}
