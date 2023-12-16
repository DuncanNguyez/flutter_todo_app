import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/tasks/tasks_state.dart';

class TasksNotifier extends StateNotifier<TasksState> {
  final TaskRepository _taskRepository = TaskRepository();
  TasksNotifier() : super(const TasksState.initial()) {
    getTasks();
  }

  void createTask(Task task) {
    _taskRepository.add(task);
    getTasks();
  }

  Future<void> deleteTask(Task task) async {
    _taskRepository.delete(task);
    getTasks();
  }

  void updateTask(Task task) {
    _taskRepository.update(task);
    getTasks();
  }

  void getTasks() async {
    final tasks = await _taskRepository.getAll();
    state = TasksState(tasks: tasks);
  }
}
