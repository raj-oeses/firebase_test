import 'package:flutter/material.dart';
import 'package:test_project/core/constants/demo_data.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/feature/home_page/pages/components/intro_section.dart';

import 'custom_tiles.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizeBox10,
              const IntroSection(),
              sizeBox10,
              Heading(title: 'Recent History', onTap: () {}),
              sizeBox10,
              ...historyList.map((element) => HistoryTile(data: element)),
              sizeBox10,
              Heading(title: 'Recent assessments', onTap: () {}),
              sizeBox10,
              ...historyList
                  .map((element) => RecentAssessmentTile(data: element)),
            ],
          ),
        ),
      ),
    );
  }
}
