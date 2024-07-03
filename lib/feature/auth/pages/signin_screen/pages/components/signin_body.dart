import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:test_project/core/utils/properties.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/routers/app_routers.dart';
import '../../../../../../core/widget/custom_input.dart';
import '../../../../../../core/widget/logo_widget.dart';
import '../../../provider/firebase_auth.dart';
import '../../provider/signin_provider.dart';
import '../../provider/signin_state.dart';

class SignInBody extends ConsumerStatefulWidget {
  const SignInBody({super.key});

  @override
  ConsumerState<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends ConsumerState<SignInBody> {
  final formKey = GlobalKey<FormBuilderState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignInState signInState = ref.watch(signInProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 80.0),
          const LogoWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 20, right: 20),
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  AuthTextFieldUi(
                    key: const Key('email_key'),
                    controller: emailController,
                    name: 'email',
                    leadingAssets: authImage('signup_email'),
                    hint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || !GetUtils.isEmail(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AuthTextFieldUi(
                    key: const Key('password_key'),
                    name: 'password',
                    leadingAssets: authImage('login_password'),
                    hint: 'Password',
                    controller: passwordController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: signInState.obscurePassword,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onSuffixIconClick: (value) => ref
                        .read(signInProvider.notifier)
                        .changeObscurePassword(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        key: const Key('login_btn_key'),
                        onPressed: () => _validate(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)
                          )
                        ),
                        child: Text(
                          'Login'.toUpperCase(),
                          style: context.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        key: const Key('register_btn_key'),
                        onPressed: () => Get.toNamed(AppRoutes.SIGN_UP),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          backgroundColor: Colors.blueGrey.withOpacity(0.7),
                        ),
                        child: Text('Sign Up'.toUpperCase(),
                            style: context.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.colorScheme.onPrimary)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: context.textTheme.labelLarge?.copyWith(
                            color: context.theme.primaryColorDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validate() async {
    if (formKey.currentState!.validate()) {
      await Auth().signIn(
          email: emailController.text.trim(),
          password: passwordController.text);
    }
  }
}
