class NewAssessmentState {
  final bool isIgnoring;
  final String? selectedStatus;
  final String? selectedMeasure;
  final List<String>? status;
  final List<String>? measures;
  final bool? isLoading;
  String? fullName;

  NewAssessmentState({
    this.isIgnoring = true,
    this.status,
    this.selectedStatus,
    this.selectedMeasure,
    this.measures,
    this.isLoading = false,
    this.fullName,
  });

  NewAssessmentState copy({
    bool? isIgnoring,
    String? selectedStatus,
    String? selectedMeasure,
    List<String>? status,
    List<String>? measures,
    bool? isLoading,
    String? fullName,
  }) =>
      NewAssessmentState(
        isIgnoring: isIgnoring ?? this.isIgnoring,
        selectedStatus: selectedStatus ?? this.selectedStatus,
        selectedMeasure: selectedMeasure ?? this.selectedMeasure,
        status: status ?? this.status,
        measures: measures ?? this.measures,
        isLoading: isLoading ?? this.isLoading,
        fullName: fullName ?? this.fullName,
      );
}
