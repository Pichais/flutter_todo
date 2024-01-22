part of 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';

abstract class Homestate extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitailState extends Homestate {}

class FinishState extends Homestate {
  // final TodoModel todoModel;
  final List<Tasks> tasks;
  final int pageNumber;
  final int totalPages;

  FinishState({
    required this.tasks,
    required this.pageNumber,
    required this.totalPages,
  });

  FinishState copyWith({List<Tasks>? tasks, int? pageNumber, int? totalPages}) {
    return FinishState(
      tasks: tasks ?? this.tasks,
      pageNumber: pageNumber ?? this.pageNumber,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props => [
        tasks,
        pageNumber,
        totalPages,
      ];
}

class ErrorState extends Homestate {}
