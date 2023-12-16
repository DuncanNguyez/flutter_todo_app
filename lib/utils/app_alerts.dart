import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  const AppAlerts._();
  static bool _active = false;

  static void displaySnackbar(
      {required BuildContext context, required String message, Color? color}) {
    if (!_active) {
      _active = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Center(
                child: Text(
              message,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: color ?? Colors.green[500]),
            )),
            backgroundColor: context.colors.primaryContainer,
          ))
          .closed
          .then((value) => _active = false);
    }
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Task task,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text('NO'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref
            .read(AppProviders.tasksProvider.notifier)
            .deleteTask(task)
            .then(
          (value) {
            displaySnackbar(
              context: context,
              message: 'Task deleted successfully',
            );
            context.pop();
          },
        );
      },
      child: const Text('YES'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
