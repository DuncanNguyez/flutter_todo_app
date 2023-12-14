import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/widgets/display_task_icon.dart';

class DisplayTaskItem extends StatelessWidget {
  const DisplayTaskItem({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final double coefficientOpacity = task.isCompleted ? 0.3 : 1;
    final TextDecoration textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final FontWeight fontWeight =
        task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Row(
      children: [
        DisplayTaskIcon(
          task: task,
          coefficientOpacity: coefficientOpacity,
        ),
        const Gap(16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                  decoration: textDecoration,
                  fontWeight: fontWeight,
                  fontSize: 20),
            ),
            Text(task.time)
          ],
        )),
        Checkbox(
            value: task.isCompleted,
            onChanged: (value) => value == null ? true : !value)
      ],
    );
  }
}
