class NewAssessmentState {
  final bool isIgnoring;
  final String? selectedStatus;
  final String? selectedMeasure;
  final List<String>? status;
  final List<String>? measures;

  NewAssessmentState({
    this.isIgnoring = true,
    this.status,
    this.selectedStatus,
    this.selectedMeasure,
    this.measures,
  });

  NewAssessmentState copy({
    bool? isIgnoring,
    String? selectedStatus,
    String? selectedMeasure,
    List<String>? status,
    List<String>? measures,
  }) =>
      NewAssessmentState(
        isIgnoring: isIgnoring ?? this.isIgnoring,
        selectedStatus: selectedStatus ?? this.selectedStatus,
        selectedMeasure: selectedMeasure ?? this.selectedMeasure,
        status: status ?? this.status,
        measures: measures ?? this.measures,
      );
}
