import 'package:todoapp/data/data.dart';
import 'package:todoapp/data/repositories/abstract_task_repository.dart';

class TaskRepository extends AbstractTaskRepository {
  final TaskDatasource _datasource = TaskDatasource();
  TaskRepository._();
  factory TaskRepository() => TaskRepository._();

  @override
  Future<void> add(Task task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> delete(Task task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAll() async {
    try {
      return _datasource.getTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> update(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
