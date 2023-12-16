import '../models/models.dart';

abstract class AbstractTaskRepository {
  Future<void> add(Task task);
  Future<void> update(Task task);
  Future<void> delete(Task task);
  Future<List<Task>> getAll();
}

