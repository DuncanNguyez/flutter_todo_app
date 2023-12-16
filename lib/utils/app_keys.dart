import 'package:flutter/material.dart';

@immutable
class AppKeys {
  const AppKeys._();
  static const String isDarkMode = 'isDarkMode';
  static const String dbTable = 'tasks';
  static const TaskKeys taskKeys = TaskKeys._();
}

@immutable
class TaskKeys {
  const TaskKeys._();
   final String id = 'id';
   final String title = 'title';
   final String category = 'category';
   final String date = 'date';
   final String time = 'time';
   final String note = 'note';
   final String isCompleted = 'isCompleted';
}
