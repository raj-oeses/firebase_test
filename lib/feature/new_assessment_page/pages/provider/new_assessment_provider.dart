import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/feature/new_assessment_page/pages/provider/new_assessment_state.dart';

class NewAssessmentProvider extends StateNotifier<NewAssessmentState> {
  NewAssessmentProvider(super.state) {
    _initialize();
  }

  _initialize() => state = state.copy(
      status: ['Normal', 'Mild Cognitive Impairment', 'Dementia', 'Other']);

  //select status
  changeStatus(String? status) {
    state = state.copy(
        selectedStatus: status,
        isIgnoring: false,
        measures: _giveMeasures(status));
    state = state.copy(selectedMeasure: state.measures?.first);
  }

  //get measures
  changeMeasures(String? status) =>
      state = state.copy(selectedMeasure: status, isIgnoring: false);

  List<String>? _giveMeasures(String? status) {
    // state = state.copy(measures: []);
    switch (status) {
      case "Normal":
        return ['one', 'two'];
      case "Mild Cognitive Impairment":
        return ['three', 'four'];
      case "Dementia":
        return ['five', 'six'];
      case "Other":
        return ['seven', 'eight'];
      default:
        return [];
    }
  }
}

final newAssessProvider =
    StateNotifierProvider<NewAssessmentProvider, NewAssessmentState>(
        (ref) => NewAssessmentProvider(NewAssessmentState()));
