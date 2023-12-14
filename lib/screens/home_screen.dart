import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const DisplayListOfTask(
                      tasks: [
                        Task(
                            title: "title",
                            note: "note",
                            time: "time",
                            date: "Aug 07 2023",
                            isCompleted: false,
                            category: TaskCategory.education),
                        Task(
                            title: "title",
                            note: "note",
                            time: "time",
                            date: "Aug 07 2023",
                            isCompleted: false,
                            category: TaskCategory.health)
                      ],
                      isCompleted: false,
                    ),
                    const Gap(20),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTask(
                      tasks: [
                        Task(
                            title: "title",
                            note: "note",
                            time: "time",
                            date: "Aug 07 2023",
                            isCompleted: true,
                            category: TaskCategory.work),
                        Task(
                            title: "title",
                            note: "note",
                            time: "time",
                            date: "Aug 07 2023",
                            isCompleted: true,
                            category: TaskCategory.shopping)
                      ],
                      isCompleted: true,
                    ),
                    const Gap(60),
                    ElevatedButton(
                        onPressed: () {},
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
