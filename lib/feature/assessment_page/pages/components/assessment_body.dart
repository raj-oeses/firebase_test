import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/feature/assessment_page/pages/components/tab0.dart';
import 'package:test_project/feature/assessment_page/pages/components/tab1.dart';
import 'package:test_project/feature/assessment_page/pages/components/tab2.dart';
import 'package:test_project/feature/assessment_page/pages/components/tab3.dart';
import 'package:test_project/feature/assessment_page/pages/components/tab4.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';

class AssessmentBody extends ConsumerWidget {
  const AssessmentBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessState = ref.watch(assessProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          sizeBox10,
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5, (index) => _tab(isSelected: index <= assessState.page))),
          sizeBox10,
          if (assessState.page == 0) Tab0(),
          if (assessState.page == 1) Tab1(),
          if (assessState.page == 2) Tab2(),
          if (assessState.page == 3) Tab3(),
          if (assessState.page == 4) Tab4(),
        ],
      ),
    );
  }

  _tab({required bool isSelected}) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: 40.0,
      decoration: BoxDecoration(
          color: isSelected ? black600 : grey200,
          borderRadius: BorderRadius.circular(50.0)));
}
