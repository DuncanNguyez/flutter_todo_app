import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/widgets/common_text_field.dart';

class DisplaySelectDateTime extends ConsumerWidget {
  const DisplaySelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(AppProviders.dateProvider);
    final time = ref.watch(AppProviders.timeProvider);
    void selectTime(BuildContext context, WidgetRef ref) async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: time,
      );
      if (pickedTime != null) {
        ref.read(AppProviders.timeProvider.notifier).state = pickedTime;
      }
    }

    void selectDate(BuildContext context, WidgetRef ref) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2023),
        lastDate: DateTime(2060),
      );
      if (pickedDate != null) {
        ref.read(AppProviders.dateProvider.notifier).state = pickedDate;
      }
    }

    return Row(
      children: [
        Expanded(
            child: Focus(
          onFocusChange: (hasFocus) async =>
              hasFocus ? selectDate(context, ref) : Void,
          child: CommonTextField(
            title: "Date",
            hintText: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
              icon: const FaIcon(FontAwesomeIcons.calendar),
              onPressed: () {},
            ),
          ),
        )),
        const Gap(8),
        Expanded(
            child: Focus(
          onFocusChange: (hasFocus) async =>
              hasFocus ? selectTime(context, ref) : Void,
          child: CommonTextField(
            title: "Time",
            readOnly: true,
            hintText: time.format(context),
            suffixIcon: IconButton(
              icon: const FaIcon(FontAwesomeIcons.clock),
              onPressed: () {},
            ),
          ),
        ))
      ],
    );
  }
}
