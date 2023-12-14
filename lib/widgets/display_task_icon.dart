import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';

class DisplayTaskIcon extends StatelessWidget {
  const DisplayTaskIcon(
      {super.key, required this.task, this.coefficientOpacity});
  final Task task;
  final double? coefficientOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              task.category.color.withOpacity(0.3 * (coefficientOpacity ?? 1)),
          border: Border.all(
              width: 2,
              color: task.category.color.withOpacity(coefficientOpacity ?? 1))),
      child: Center(
          child: Icon(
        task.category.icon,
        color: task.category.color.withOpacity(coefficientOpacity ?? 1),
      )),
    );
  }
}
