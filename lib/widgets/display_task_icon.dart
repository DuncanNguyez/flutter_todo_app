import 'package:flutter/material.dart';
import 'package:todoapp/utils/task_categories.dart';

class DisplayTaskIcon extends StatelessWidget {
  const DisplayTaskIcon(
      {super.key, this.coefficientOpacity, required this.category});
  final TaskCategory category;
  final double? coefficientOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: category.color.withOpacity(0.3 * (coefficientOpacity ?? 1)),
          border: Border.all(
              width: 2,
              color: category.color.withOpacity(coefficientOpacity ?? 1))),
      child: Center(
          child: Icon(
        category.icon,
        color: category.color.withOpacity(coefficientOpacity ?? 1),
      )),
    );
  }
}
