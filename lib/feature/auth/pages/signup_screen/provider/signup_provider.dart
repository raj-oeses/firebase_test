import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signup_state.dart';


class SignupProvider extends StateNotifier<SignUpState> {
  SignupProvider(super.state);

  isPasswordVisible() {
    print('isPasswordVisible ${state.obscurePassword}'); //
    state = state.copy(obscurePassword: !state.obscurePassword!);
  }

  isConfirmPasswordVisible() => state =
      state.copy(obscureConfirmPassword: !state.obscureConfirmPassword!);

  isNextLoading() => state = state.copy(isNextLoading: !state.isNextLoading!);

  changeGender({required String? gender}) =>
      state = state.copy(groupValue: gender);
}

final signupProvider = StateNotifierProvider<SignupProvider, SignUpState>(
    (ref) => SignupProvider(SignUpState()));
