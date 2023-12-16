import 'package:equatable/equatable.dart';
import 'package:todoapp/utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategory category;

  const Task(
      {this.id,
      required this.title,
      required this.note,
      required this.time,
      required this.date,
      required this.isCompleted,
      required this.category});

  @override
  List<Object?> get props =>
      [id!, time, title, note, date, isCompleted, category];

  Task copyWith({
    int? id,
    String? title,
    String? note,
    TaskCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AppKeys.taskKeys.id: id,
      AppKeys.taskKeys.title: title,
      AppKeys.taskKeys.note: note,
      AppKeys.taskKeys.category: category.name,
      AppKeys.taskKeys.time: time,
      AppKeys.taskKeys.date: date,
      AppKeys.taskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Task(
        id: map[AppKeys.taskKeys.id],
        title: map[AppKeys.taskKeys.title],
        note: map[AppKeys.taskKeys.note],
        time: map[AppKeys.taskKeys.time],
        date: map[AppKeys.taskKeys.date],
        isCompleted: map[AppKeys.taskKeys.isCompleted] == 1 ? true : false,
        category: TaskCategory.fromString(map[AppKeys.taskKeys.category]));
  }
}
