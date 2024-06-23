import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/constants/demo_data.dart';
import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_state.dart';
import 'package:test_project/feature/new_assessment_page/data/model/patient_data_model.dart';

import '../../data/model/store_data_model.dart';

class AssessmentProvider extends StateNotifier<AssessmentState> {
  AssessmentProvider(super.state);

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  StoreDataModel storeDataModel = StoreDataModel();

  initialize() {
    animalList.forEach((element) => element.isSelected = false);
    storeDataModel = StoreDataModel();
    state = state.copy(
        page: 0,
        correctOrIncorrect: StatusEnum.correct.toShortString(),
        selectedItems: [],
        rightAnimal: 0,
        showAllDescription: false,
        animalAssessment: [...animalList]);
  }

  incrementPage() => state = state.copy(page: state.page + 1);

  decrementPage() => state = state.copy(page: state.page - 1);

  changeStatus(String data) => state = state.copy(correctOrIncorrect: data);

  showDescription() =>
      state = state.copy(showAllDescription: !state.showAllDescription!);

  selectItems(String name) {
    if (state.selectedItems?.contains(name) ?? false) {
      state.selectedItems?.remove(name);
    } else {
      state.selectedItems?.add(name);
    }
    state = state.copy(selectedItems: state.selectedItems);
  }

  changeSelectedAnimalStatus(int index) {
    int rightAnimal = 0;
    animalList[index].isSelected = !animalList[index].isSelected!;
    for (var ele in animalList) {
      if (ele.isSelected ?? false) {
        rightAnimal += 1;
      }
    }
    state =
        state.copy(animalAssessment: [...animalList], rightAnimal: rightAnimal);
  }

  //Store in Firebase Database
  Future<bool> storeData(PatientDataModel? data) async {
    state = state.copy(isLoading: true);
    //this is to find jill true answers
    int jillRightStory = 0;
    trueAnswers.forEach((element) {
      if (state.selectedItems!.contains(element)) {
        jillRightStory += 1;
      }
    });
    int jillWrongStory = assessmentSelectableItems.length - jillRightStory;

    //this is storing model
    StoreDataModel storeDataModel = StoreDataModel(
        id: '',
        measures: data?.measures,
        patientName: data?.patientName,
        status: data?.status,
        fingerRaised: state.correctOrIncorrect,
        jillStoryCorrect: jillRightStory,
        jillStoryIncorrect: jillWrongStory,
        animalIdentifyCorrect: state.rightAnimal,
        animalIdentifyInorrect: animalList.length - state.rightAnimal!.toInt());

    ///Saving in data base
    try {
      await _db.collection('data').add(storeDataModel.toJson());
      state = state.copy(isLoading: false);
      return true;
    } catch (e) {
      print('Exception:::::::::$e');
    }
    state = state.copy(isLoading: false);
    return false;
  }

  showAllQuestions() =>
      state = state.copy(showAllQuestions: !state.showAllQuestions!);
}

final assessProvider =
    StateNotifierProvider<AssessmentProvider, AssessmentState>(
        (ref) => AssessmentProvider(AssessmentState()));
