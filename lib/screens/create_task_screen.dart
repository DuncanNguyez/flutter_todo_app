import 'package:flutter/material.dart';
import 'package:todoapp/widgets/display_white_text.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: "Add new task"),
      ),
    );
  }
}
