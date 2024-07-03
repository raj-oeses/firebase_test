class SignInState {
  final bool? isLoginLoading;
  final bool? isRememberMeChecked;
  final bool? isAutoLoginChecked;
  final bool? obscurePassword;

  SignInState({
    this.isLoginLoading=false,
    this.isAutoLoginChecked = true,
    this.isRememberMeChecked = true,
    this.obscurePassword = true,
  });

  SignInState copy({
    bool? isLoginLoading,
    bool? isAutoLoginChecked,
    bool? isRememberMeChecked,
    bool? obscurePassword,
  }) =>
      SignInState(
        isLoginLoading: isLoginLoading ?? this.isLoginLoading,
        isAutoLoginChecked: isAutoLoginChecked ?? this.isAutoLoginChecked,
        isRememberMeChecked: isRememberMeChecked ?? this.isRememberMeChecked,
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}
