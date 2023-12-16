import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_text_field.dart';
import 'package:todoapp/widgets/display_select_categories.dart';
import 'package:todoapp/widgets/display_select_date_time.dart';
import 'package:todoapp/widgets/display_white_text.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final titleEditController = TextEditingController();
  final noteEditController = TextEditingController();

  @override
  void dispose() {
    titleEditController.dispose();
    noteEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const DisplayWhiteText(text: "Add new task"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const AlwaysScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Gap(30),
            CommonTextField(
              controller: titleEditController,
              title: "Title",
              hintText: "Task title",
            ),
            const Gap(20),
            const DisplaySelectCategories(),
            const Gap(20),
            const DisplaySelectDateTime(),
            const Gap(20),
            CommonTextField(
              controller: noteEditController,
              title: "Notes",
              hintText: "Notes",
              maxLines: 6,
            ),
            const Gap(50),
            ElevatedButton(
                onPressed: save,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: DisplayWhiteText(text: "Save"),
                ))
          ]),
        )));
  }

  void save() {
    String title = titleEditController.text;
    String note = noteEditController.text;
    String time =
        ref.read(AppProviders.timeProvider.notifier).state.format(context);
    String date =
        DateFormat.yMMMd().format(ref.read(AppProviders.dateProvider));
    TaskCategory category = ref.read(AppProviders.categoryProvider);
    Task task = Task(
        title: title,
        note: note,
        time: time,
        date: date,
        isCompleted: false,
        category: category);
    if (title.isEmpty) {
      AppAlerts.displaySnackbar(
          context: context,
          message: "Title is cannot empty!",
          color: Colors.red[500]!);
    } else {
      ref.watch(AppProviders.tasksProvider.notifier).createTask(task);
      const textEmptyValue = TextEditingValue();
      titleEditController.value = textEmptyValue;
      noteEditController.value = textEmptyValue;
      AppAlerts.displaySnackbar(
          context: context, message: "Created task successfully!");
    }
  }
}
