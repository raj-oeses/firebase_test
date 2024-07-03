class LandingPageState {
  final bool? isLandingPageLoading;
  final bool? isBusinessCreatedLoading;
  final bool? showFloatingAction;
  final double? sizeFloatingBtn;

  LandingPageState({
    this.isLandingPageLoading,
    this.isBusinessCreatedLoading,
    this.showFloatingAction,
    this.sizeFloatingBtn,
  });

  LandingPageState copy({
    final bool? isLandingPageLoading,
    final bool? isBusinessCreatedLoading,
    final bool? showFloatingAction,
    final double? sizeFloatingBtn,
  }) =>
      LandingPageState(
        isLandingPageLoading: isLandingPageLoading ?? this.isLandingPageLoading,
        isBusinessCreatedLoading:
            isBusinessCreatedLoading ?? this.isBusinessCreatedLoading,
        showFloatingAction: showFloatingAction ?? this.showFloatingAction,
        sizeFloatingBtn: sizeFloatingBtn ?? this.sizeFloatingBtn,
      );
}
