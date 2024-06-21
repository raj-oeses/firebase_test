import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/constants/demo_data.dart';
import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/feature/assessment_page/pages/provider/assessment_state.dart';

class AssessmentProvider extends StateNotifier<AssessmentState> {
  AssessmentProvider(super.state);

  initialize() {
    animalList.forEach((element) => element.isSelected = false);
    state = state.copy(
        page: 0,
        correctOrIncorrect: StatusEnum.correct.toShortString(),
        selectedItems: [],
        animalAssessment: [...animalList]);
  }

  incrementPage() => state = state.copy(page: state.page + 1);

  decrementPage() => state = state.copy(page: state.page - 1);

  changeStatus(String data) => state = state.copy(correctOrIncorrect: data);

  showDescription() =>
      state = state.copy(showAllDescription: !state.showAllDescription!);

  selectItems(String name) {
    print('name $name');
    if (state.selectedItems?.contains(name) ?? false) {
      state.selectedItems?.remove(name);
      // state=state.copy(selectedItems: );
    } else {
      state.selectedItems?.add(name);
    }
    state = state.copy(selectedItems: state.selectedItems);
    print('selectedItems ${state.selectedItems?.toList()}');
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
}

final assessProvider =
    StateNotifierProvider<AssessmentProvider, AssessmentState>(
        (ref) => AssessmentProvider(AssessmentState()));
