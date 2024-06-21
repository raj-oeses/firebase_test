import 'package:flutter/material.dart';
import 'package:test_project/core/constants/demo_data.dart';

import '../../../../core/utils/properties.dart';
import 'heading_section.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeBox30,
        DescriptionSection(description: 'Recall question:'),
        sizeBox20,
        const HeadingSection(title: 'Read the sentences'),
        sizeBox20,
        DescriptionSection(
            description: readSentence, textAlign: TextAlign.left),
      ],
    );
  }
}
