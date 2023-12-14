import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  List<Object?> get props => [id!, time, title, note, date, isCompleted];
}
