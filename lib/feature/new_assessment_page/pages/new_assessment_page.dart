import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/widgets/app_bar.dart';
import 'package:test_project/feature/home_page/data/model/history_model.dart';
import 'package:test_project/feature/new_assessment_page/pages/components/new_assessment_body.dart';
import 'package:test_project/feature/new_assessment_page/pages/provider/new_assessment_provider.dart';

import '../../../core/widgets/custom_button.dart';

class NewAssessmentPage extends ConsumerWidget {
  final HistoryModel? data;

  const NewAssessmentPage({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nwAssessState = ref.watch(newAssessProvider);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Assestment'),
      body: NewAssessmentBody(data: data),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShadowButton(
            onPressed: () {},
            isDisable: nwAssessState.isIgnoring,
            text: 'Start assessment'),
      ),
    );
  }
}
