import 'package:test_project/feature/assessment_page/data/model/animal_model.dart';

class AssessmentState {
  final int page;
  final String? correctOrIncorrect;
  final bool? showAllDescription;
  final bool? isLoading;
  final bool? showAllQuestions;
  final List<String>? selectedItems;
  final List<AnimalModel>? animalAssessment;
  final int? rightAnimal;


  AssessmentState({
    this.page = 0,
    this.correctOrIncorrect,
    this.showAllDescription = false,
    this.isLoading = false,
    this.showAllQuestions = false,
    this.selectedItems,
    this.animalAssessment,
    this.rightAnimal=0,
  });

  AssessmentState copy({
    int? page,
    String? correctOrIncorrect,
    bool? showAllDescription,
    bool? isLoading,
    bool? showAllQuestions,
    List<String>? selectedItems,
    List<AnimalModel>? animalAssessment,
    int? rightAnimal,
  }) =>
      AssessmentState(
        page: page ?? this.page,
        correctOrIncorrect: correctOrIncorrect ?? this.correctOrIncorrect,
        showAllDescription: showAllDescription ?? this.showAllDescription,
        isLoading: isLoading ?? this.isLoading,
        showAllQuestions: showAllQuestions ?? this.showAllQuestions,
        selectedItems: selectedItems ?? this.selectedItems,
        animalAssessment: animalAssessment ?? this.animalAssessment,
        rightAnimal: rightAnimal ?? this.rightAnimal,
      );
}
