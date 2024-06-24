import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/feature/home_page/data/model/history_model.dart';
import 'package:test_project/feature/new_assessment_page/data/model/patient_data_model.dart';
import 'package:test_project/feature/new_assessment_page/pages/provider/new_assessment_state.dart';

class NewAssessmentProvider extends StateNotifier<NewAssessmentState> {
  NewAssessmentProvider(super.state) {
    _initialize();
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  _initialize() => state = state.copy(
      status: ['Normal', 'Mild Cognitive Impairment', 'Dementia', 'Other'],
      fullName: '');

  //setup if there is any value
  setValue(HistoryModel? data) => changeStatus(data?.testName);

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

  Future<bool> saveUserData() async {
    state = state.copy(isLoading: true);
    PatientDataModel patientData = PatientDataModel(
        status: state.selectedStatus,
        measures: state.selectedMeasure,
        patientName: state.fullName);

    //Saving in data base
    try {
      await _db.collection('patientDetail').add(patientData.toJson());
      state = state.copy(isLoading: false);
      return true;
    } catch (e) {
      print('Exception::::::::$e');
    }
    state = state.copy(isLoading: false);
    return false;
  }
}

final newAssessProvider =
    StateNotifierProvider<NewAssessmentProvider, NewAssessmentState>(
        (ref) => NewAssessmentProvider(NewAssessmentState()));
