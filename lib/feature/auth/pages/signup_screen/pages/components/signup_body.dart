import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:test_project/core/utils/properties.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/field_validator.dart';
import '../../../../../../core/widget/custom_input.dart';
import '../../../../../../core/widget/logo_widget.dart';
import '../../../../data/model/register_model.dart';
import '../../../provider/firebase_auth.dart';
import '../../provider/signup_provider.dart';
import '../../provider/signup_state.dart';
import 'gender_radio_ui.dart';

class SignUpBody extends ConsumerStatefulWidget {
  const SignUpBody({super.key});

  @override
  ConsumerState<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends ConsumerState<SignUpBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKeySignUp = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // emailController.text = 'a@g.com';
    // nameController.text = 'ashish rajbanshi';
    // passwordController.text = 'Pasword@123';
    // confirmPasswordController.text = 'Pasword@123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignUpState state = ref.watch(signupProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 70.0,
          ),
          const LogoWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: FormBuilder(
              key: formKeySignUp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Account Information',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AuthTextFieldUi(
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
                  const SizedBox(height: 12.0),
                  AuthTextFieldUi(
                    controller: passwordController,
                    name: 'password',
                    leadingAssets: authImage('signup_password'),
                    hint: 'Password',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: state.obscurePassword,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: FieldValidator.validatePassword,
                    onSuffixIconClick: (v) =>
                        ref.read(signupProvider.notifier).isPasswordVisible(),
                  ),
                  const SizedBox(height: 12.0),
                  AuthTextFieldUi(
                    controller: confirmPasswordController,
                    name: 'confirmpassword',
                    leadingAssets: authImage('signup_password_1'),
                    hint: 'Confirm Password',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: state.obscureConfirmPassword,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      final bool isValid = passwordController.text == value;
                      return isValid ? null : "Password doesn't match";
                    },
                    onSuffixIconClick: (v) => ref
                        .read(signupProvider.notifier)
                        .isConfirmPasswordVisible(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 12.0),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        onPressed: () => _validate(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          backgroundColor: Colors.blueGrey.withOpacity(0.7),
                        ),
                        child: Text(
                          'Next'.toUpperCase(),
                          style: context.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.onPrimary,
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
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        ),
                        child: Text(
                          'Already have account?',
                          style: context.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
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

  void _validate() async {
    Get.focusScope!.unfocus();
    if (formKeySignUp.currentState!.validate()) {
      await Auth().signUp(
          data: RegisterModel(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              creationTime: DateTime.now()));
    }
  }
}
