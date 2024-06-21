import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/constants/demo_data.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/widgets/custom_image.dart';
import 'package:test_project/feature/assessment_page/data/model/animal_model.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';

import '../../../../core/utils/properties.dart';
import 'heading_section.dart';

const _imageSize = 70.0;

class Tab3 extends ConsumerWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessState = ref.watch(assessProvider);
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          sizeBox30,
          const HeadingSection(title: 'Identify the animals'),
          sizeBox20,
          const DescriptionSection(
              description:
                  'Please show the patient the following\nanimals and check their response.'),
          sizeBox20,
          ...assessState.animalAssessment!.map((element) => AnimalTile(
              data: element,
              onChanged: (val) {
                print(
                    'index ${assessState.animalAssessment?.indexOf(element)}');
                ref.read(assessProvider.notifier).changeSelectedAnimalStatus(
                    assessState.animalAssessment!.indexOf(element));
              })),
          sizeBox10,
        ],
      ),
    );
  }
}

class AnimalTile extends StatelessWidget {
  final AnimalModel? data;
  final ValueChanged<bool> onChanged;

  const AnimalTile({super.key, required this.data, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: grey200),
        sizeBox10,
        Row(
          children: [
            Container(
              height: _imageSize,
              width: _imageSize,
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  border: Border.all(color: grey200, width: 1),
                  borderRadius: BorderRadius.circular(_imageSize)),
              child: CustomAssetImage(
                  imageLocation: pngImage(data?.image),
                  color: Colors.transparent),
            ),
            widthBox10,
            Expanded(
              child: Text(
                data?.name ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16, color: black600),
              ),
            ),
            Switch(
              value: data!.isSelected!,
              onChanged: onChanged,
            )
          ],
        ),
        sizeBox10
      ],
    );
  }
}
