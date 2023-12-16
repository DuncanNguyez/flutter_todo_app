import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/providers/app_providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/display_task_icon.dart';

class DisplaySelectCategories extends ConsumerWidget {
  const DisplaySelectCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const categories = TaskCategory.values;
    final categoryProvider = ref.watch(AppProviders.categoryProvider);

    return SizedBox(
        height: 60,
        child: Row(children: [
          Text(
            "Categories",
            style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
          const Gap(12),
          Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          ref
                              .read(AppProviders.categoryProvider.notifier)
                              .state = categories[index];
                        },
                        child: DisplayTaskIcon(
                          category: categories[index],
                          coefficientOpacity:
                              categoryProvider == categories[index] ? 1 : 0.25,
                        ),
                      ),
                  separatorBuilder: (ctx, ref) => const Gap(8),
                  itemCount: categories.length))
        ]));
  }
}
