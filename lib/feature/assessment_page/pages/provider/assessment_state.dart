import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/feature/assessment_page/data/model/animal_model.dart';

class AssessmentState {
  final int page;
  final String? correctOrIncorrect;
  final bool? showAllDescription;
  final List<String>? selectedItems;
  final List<AnimalModel>? animalAssessment;
  final int? rightAnimal;


  AssessmentState({
    this.page = 0,
    this.correctOrIncorrect,
    this.showAllDescription = false,
    this.selectedItems,
    this.animalAssessment,
    this.rightAnimal=0,
  });

  AssessmentState copy({
    int? page,
    String? correctOrIncorrect,
    bool? showAllDescription,
    List<String>? selectedItems,
    List<AnimalModel>? animalAssessment,
    int? rightAnimal,
  }) =>
      AssessmentState(
        page: page ?? this.page,
        correctOrIncorrect: correctOrIncorrect ?? this.correctOrIncorrect,
        showAllDescription: showAllDescription ?? this.showAllDescription,
        selectedItems: selectedItems ?? this.selectedItems,
        animalAssessment: animalAssessment ?? this.animalAssessment,
        rightAnimal: rightAnimal ?? this.rightAnimal,
      );
}
