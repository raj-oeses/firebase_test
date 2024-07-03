
class SignUpState {
  final bool? obscurePassword;
  final bool? obscureConfirmPassword;
  final bool? isNextLoading;
  final String? groupValue;

  SignUpState(
      {this.obscurePassword = true,
      this.obscureConfirmPassword = true,
      this.isNextLoading = false,
      this.groupValue='Male'});

  SignUpState copy(
          {bool? obscurePassword,
          bool? obscureConfirmPassword,
          bool? isNextLoading,
          String? groupValue}) =>
      SignUpState(
          obscurePassword: obscurePassword ?? this.obscurePassword,
          obscureConfirmPassword:
              obscureConfirmPassword ?? this.obscureConfirmPassword,
          isNextLoading: isNextLoading ?? this.isNextLoading,
          groupValue: groupValue ?? this.groupValue);
}
