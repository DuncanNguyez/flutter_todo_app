import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask(
      {super.key, required this.tasks, required this.isCompleted});
  final List<Task> tasks;
  final bool isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String message = isCompleted
        ? "There is no completed task yet"
        : "There is no task todo";
    return Container(
      width: context.deviceSize.width,
      height: context.deviceSize.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colors.primaryContainer),
      child: tasks.isEmpty
          ? Center(
              child: Text(
                message,
                style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return DisplayTaskDetail(task: task);
                        });
                  },
                  onLongPress: () => AppAlerts.showAlertDeleteDialog(
                      context: context, ref: ref, task: task),
                  child: DisplayTaskItem(task: task),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.2,
                );
              },
            ),
    );
  }
}
