import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/constants/demo_data.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/properties.dart';
import 'heading_section.dart';

const _iconSize = 25.0;

class Tab1 extends ConsumerWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessState = ref.watch(assessProvider);
    return Column(
      children: [
        sizeBox30,
        const HeadingSection(title: 'Story ”Jill went to the shop”'),
        sizeBox20,
        ExpandableDescriptionSection(
            description:
                'Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day.',
            seeAllOnTap: () =>
                ref.read(assessProvider.notifier).showDescription(),
            showAll: ref.watch(assessProvider).showAllDescription),
        ...assessmentSelectableItems.map(
          (element) => Column(
            children: [
              SelectableButton(
                  title: element,
                  isSelected:
                      assessState.selectedItems?.contains(element) ?? false,
                  onTap: () =>
                      ref.read(assessProvider.notifier).selectItems(element)),
              sizeBox10,
            ],
          ),
        ),
      ],
    );
  }
}

class SelectableButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableButton(
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
            Container(
              height: _iconSize,
              width: _iconSize,
              decoration: BoxDecoration(
                  color: isSelected ? orange600 : null,

                  borderRadius: BorderRadius.circular(_iconSize),
                  border: Border.all(
                      color: isSelected ? orange600 : grey200,
                      width: isSelected ? 2 : 1)),
              child: isSelected
                  ? const Icon(Icons.check,
                      size: (_iconSize * .8), color: Colors.white)
                  : null,
            ),
            widthBox10,
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
