import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/display_task_icon.dart';

class DisplayTaskItem extends ConsumerWidget {
  const DisplayTaskItem({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double coefficientOpacity = task.isCompleted ? 0.3 : 1;
    final TextDecoration textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final FontWeight fontWeight =
        task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Row(
      children: [
        DisplayTaskIcon(
          category: task.category,
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
            onChanged: (value) {
              ref
                  .read(AppProviders.tasksProvider.notifier)
                  .updateTask(task.copyWith(isCompleted: !task.isCompleted));
              AppAlerts.displaySnackbar(
                context: context,
                message:
                    task.isCompleted ? 'Task incompleted' : 'Task completed',
                color:
                    task.isCompleted ? Colors.purple[500] : Colors.green[500],
              );
            })
      ],
    );
  }
}
