import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routers/routers.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Task> tasks = ref.watch(AppProviders.tasksProvider).tasks;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
                height: context.deviceSize.height * 0.3,
                width: context.deviceSize.width,
                color: context.colors.primary,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: "Aug 7. 2023",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      Gap(30),
                      DisplayWhiteText(
                        text: "My todo list",
                        fontSize: 40,
                      )
                    ],
                  ),
                )),
          ],
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 180,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(
                      tasks: tasks.where((t) => !t.isCompleted).toList(),
                      isCompleted: false,
                    ),
                    const Gap(20),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTask(
                      tasks: tasks.where((t) => t.isCompleted).toList(),
                      isCompleted: true,
                    ),
                    const Gap(60),
                    ElevatedButton(
                        onPressed: () {
                          context.push(RouteLocation.createTask);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(text: "Add new task"),
                        )),
                  ]),
            ))
      ],
    ));
  }
}
