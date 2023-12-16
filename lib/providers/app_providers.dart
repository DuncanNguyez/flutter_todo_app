import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/tasks/tasks_notifier.dart';
import 'package:todoapp/providers/tasks/tasks_state.dart';
import 'package:todoapp/utils/utils.dart';

class AppProviders {
  const AppProviders._();
  static final dateProvider = StateProvider<DateTime>((ref) => DateTime.now());
  static final timeProvider =
      StateProvider<TimeOfDay>((ref) => TimeOfDay.now());
  static final categoryProvider =
      StateProvider((ref) => TaskCategory.values[0]);

  static final tasksProvider = StateNotifierProvider<TasksNotifier, TasksState>(
      (ref) => TasksNotifier());
}
