import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/feature/assessment_page/pages/components/heading_section.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';

class Tab0 extends ConsumerWidget {
  const Tab0({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessState = ref.watch(assessProvider);
    return Expanded(
      child: Column(
        children: [
          sizeBox30,
          const HeadingSection(title: 'How many fingers do you see?'),
          sizeBox20,
          const DescriptionSection(
              description:
                  'Please show the patient a certain amount\nof fingers and follow their reaction.'),
          sizeBox10,
          FingerButton(
            title: StatusEnum.correct.toShortString(),
            isSelected: assessState.correctOrIncorrect ==
                StatusEnum.correct.toShortString(),
            onTap: () => ref
                .read(assessProvider.notifier)
                .changeStatus(StatusEnum.correct.toShortString()),
          ),
          sizeBox10,
          FingerButton(
            title: StatusEnum.incorrect.toShortString(),
            isSelected: assessState.correctOrIncorrect ==
                StatusEnum.incorrect.toShortString(),
            onTap: () => ref
                .read(assessProvider.notifier)
                .changeStatus(StatusEnum.incorrect.toShortString()),
          ),
          sizeBox10
        ],
      ),
    );
  }
}

class FingerButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FingerButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : null,
            borderRadius: BorderRadius.circular(13.0),
            boxShadow: isSelected ? regularBoxShadow : null,
            border: Border.all(
                color: isSelected ? orange600 : grey200,
                width: isSelected ? 2 : 1)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
