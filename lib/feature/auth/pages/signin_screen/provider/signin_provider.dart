import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/feature/auth/pages/signin_screen/provider/signin_state.dart';

class SignInProvider extends StateNotifier<SignInState> {
  SignInProvider(super.state);
  changeRememberMe()=>state=state.copy(isRememberMeChecked: !state.isRememberMeChecked!);
  changeAutoLogin()=>state=state.copy(isAutoLoginChecked: !state.isAutoLoginChecked!);
  changeObscurePassword()=>state=state.copy(obscurePassword: !state.obscurePassword!);

}

final signInProvider = StateNotifierProvider<SignInProvider, SignInState>(
    (ref) => SignInProvider(SignInState()));
