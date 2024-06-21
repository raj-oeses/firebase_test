import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/core/widgets/app_bar.dart';
import 'package:test_project/core/widgets/custom_button.dart';
import 'package:test_project/feature/assessment_page/pages/components/assessment_body.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';

import '../../../core/utils/colors.dart';
import '../data/model/store_data_model.dart';

class AssessmentPage extends ConsumerStatefulWidget {
  const AssessmentPage({super.key});

  @override
  ConsumerState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends ConsumerState<AssessmentPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => ref.read(assessProvider.notifier).initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assessState = ref.watch(assessProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'Assessment', onMenuTap: () {}),
      body: const AssessmentBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (ref.watch(assessProvider).page == 3) ...[
              Text(' ${assessState.rightAnimal} Correct',
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: orange500,
                      fontSize: 14.0)),
              sizeBox10
            ],
            assessState.page == 4
                ? Row(
                    //
                    children: [
                      Expanded(
                        child: CustomBackButton(
                            textWidget: const Text('Back',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: black600)),
                            onTap: () => ref
                                .read(assessProvider.notifier)
                                .decrementPage()),
                      ),
                      widthBox10,
                      Expanded(
                          child: ShadowButton(
                              isDisable: false,
                              onPressed: () => ref
                                  .read(assessProvider.notifier)
                                  .incrementPage(),
                              text: 'Print'))
                    ],
                  )
                : Row(
                    children: [
                      if (ref.watch(assessProvider).page > 0) ...[
                        CustomBackButton(
                            onTap: () => ref
                                .read(assessProvider.notifier)
                                .decrementPage()),
                        widthBox10
                      ],
                      Expanded(
                        child: ShadowButton(
                            isDisable: false,
                            onPressed: () => assessState.page == 3
                                ? ref.read(assessProvider.notifier).storeData()
                                : ref
                                    .read(assessProvider.notifier)
                                    .incrementPage(),
                            text:
                                assessState.page == 3 ? 'Finish' : 'Continue'),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
