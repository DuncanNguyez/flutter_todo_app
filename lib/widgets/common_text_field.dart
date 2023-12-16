import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.readOnly = false,
    this.suffixIcon,
    this.maxLines,
    this.controller,
  });
  final String title;
  final String hintText;
  final bool readOnly;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800, color: context.colors.primary),
        ),
        const Gap(10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          onChanged: (value) {},
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
