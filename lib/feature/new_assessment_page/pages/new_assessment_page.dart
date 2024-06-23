import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/toast.dart';
import 'package:test_project/core/widgets/app_bar.dart';
import 'package:test_project/feature/assessment_page/pages/assessment_page.dart';
import 'package:test_project/feature/home_page/data/model/history_model.dart';
import 'package:test_project/feature/new_assessment_page/data/model/patient_data_model.dart';
import 'package:test_project/feature/new_assessment_page/pages/components/new_assessment_body.dart';
import 'package:test_project/feature/new_assessment_page/pages/provider/new_assessment_provider.dart';

import '../../../core/widgets/custom_button.dart';

class NewAssessmentPage extends ConsumerStatefulWidget {
  final HistoryModel? data;

  const NewAssessmentPage({super.key, this.data});

  @override
  ConsumerState createState() => _NewAssessmentPageState();
}

class _NewAssessmentPageState extends ConsumerState<NewAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    final nwAssessState = ref.watch(newAssessProvider);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Assessment---'),
      body: NewAssessmentBody(data: widget.data),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShadowButton(
            onPressed: () => nwAssessState.fullName!.trim().isEmpty
                ? showToast('Input Valid Name', isValid: false)
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AssessmentPage(
                            data: PatientDataModel(
                                status: nwAssessState.selectedStatus,
                                measures: nwAssessState.selectedMeasure,
                                patientName: nwAssessState.fullName)))),
            isDisable: nwAssessState.isIgnoring,
            text: 'Start assessment'),
      ),
    );
  }
}
