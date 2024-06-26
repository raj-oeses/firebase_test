import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/properties.dart';

import '../../../../core/constants/demo_data.dart';
import '../../../home_page/data/model/history_model.dart';
import '../provider/new_assessment_provider.dart';
import 'drop_down_section.dart';

class NewAssessmentBody extends ConsumerWidget {
  final HistoryModel? data;

  const NewAssessmentBody({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nwAssessState = ref.watch(newAssessProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              DropDownSection(
                  title: 'Cognitive status',
                  hint: 'Select cognitive status',
                  status: nwAssessState.status,
                  selectedStatus: nwAssessState.selectedStatus,
                  onChanged: (newValue) => ref
                      .read(newAssessProvider.notifier)
                      .changeStatus(newValue),
                  isIgnoring: false),
              DropDownSection(
                title: 'Applicable measures',
                hint: 'Select applicable measures',
                status: nwAssessState.measures,
                selectedStatus: nwAssessState.selectedMeasure,
                isIgnoring: nwAssessState.isIgnoring,
                onChanged: (newValue) => ref
                    .read(newAssessProvider.notifier)
                    .changeMeasures(newValue),
              ),
              AutoCompleteNameField(
                  title: 'Patient',
                  isIgnoring: nwAssessState.isIgnoring,
                  onChanged: (val) => nwAssessState.fullName = val,
                  onSubmit: (val) => nwAssessState.fullName = val),
              sizeBox40,

            ],
          ),
        ),
      ),
    );
  }
}
