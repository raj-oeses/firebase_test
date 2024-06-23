import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/core/utils/toast.dart';
import 'package:test_project/core/widgets/app_bar.dart';
import 'package:test_project/core/widgets/custom_button.dart';
import 'package:test_project/core/widgets/custom_circular_progress.dart';
import 'package:test_project/feature/assessment_page/pages/components/assessment_body.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_provider.dart';
import 'package:test_project/feature/home_page/pages/home_page.dart';
import 'package:test_project/feature/new_assessment_page/data/model/patient_data_model.dart';

import '../../../core/utils/colors.dart';
import '../../new_assessment_page/pages/new_assessment_page.dart';

class AssessmentPage extends ConsumerStatefulWidget {
  final PatientDataModel? data;

  const AssessmentPage({super.key, required this.data});

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
                    children: [
                      Expanded(
                          child: CustomBackButton(
                              textWidget: const Text('Back',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: black600)),
                              onTap: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (route) => false))),
                      widthBox10,
                      Expanded(
                          child: ShadowButton(
                              isDisable: false,
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (route) => false),
                              text: 'Print'))
                    ],
                  )
                : assessState.isLoading ?? false
                    ? const CustomCircularProgress()
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
                                onPressed: () async {
                                  if (assessState.page == 3) {
                                    if (await ref
                                        .read(assessProvider.notifier)
                                        .storeData(widget.data)) {
                                      ref
                                          .read(assessProvider.notifier)
                                          .incrementPage();
                                    } else {
                                      showToast('Error');
                                    }
                                  } else {
                                    ref
                                        .read(assessProvider.notifier)
                                        .incrementPage();
                                  }
                                },
                                text: assessState.page == 3
                                    ? 'Finish'
                                    : 'Continue'),
                          )
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
