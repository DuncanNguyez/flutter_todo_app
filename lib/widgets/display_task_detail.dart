import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/widgets/display_task_icon.dart';

class DisplayTaskDetail extends StatelessWidget {
  const DisplayTaskDetail({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Gap(40),
        DisplayTaskIcon(task: task),
        const Gap(16),
        Text(
          task.title,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          task.time,
          style: context.textTheme.titleMedium,
        ),
        const Gap(16),
        Visibility(
          visible: !task.isCompleted,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Task to be completed on"),
            Text(task.date),
            Icon(
              Icons.check_box,
              color: task.category.color,
            )
          ]),
        ),
        const Gap(16),
        Divider(
          color: task.category.color,
          thickness: 1.2,
        ),
        const Gap(16),
        Text(
          task.note.isEmpty
              ? 'There is no additional note for this task'
              : task.note,
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Visibility(
          visible: task.isCompleted,
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Task Completed'),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ]),
        )
      ]),
    );
  }
}
