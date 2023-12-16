import 'package:todoapp/data/models/models.dart';
import 'package:equatable/equatable.dart';

class TasksState extends Equatable {
  final List<Task> tasks;
  const TasksState({
    required this.tasks,
  });
  const TasksState.initial({
    this.tasks = const [],
  });
  @override
  List<Object?> get props => [tasks];
}
