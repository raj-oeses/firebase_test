import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_project/core/utils/properties.dart';

class AuthTextFieldUi extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final String hint;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int maxLines;
  final bool? obscureText;
  final AutovalidateMode autoValidateMode;
  final String? leadingAssets;
  final Color? leadingColor;
  final Widget Function(BuildContext, Object, StackTrace?)? onImageError;
  final void Function(bool)? onSuffixIconClick;

  const AuthTextFieldUi({
    super.key,
    required this.name,
    this.controller,
    this.hint = '',
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.none,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.leadingAssets,
    this.leadingColor,
    this.onImageError,
    this.onSuffixIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leadingAssets != null)
          Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 8.0),
              child: Image.asset(leadingAssets!,
                  width: 32.0,
                  height: 32.0,
                  color: leadingColor ?? context.theme.primaryColor,
                  errorBuilder: onImageError)),
        Expanded(
          child: FormBuilderTextField(
            name: name,
            controller: controller,
            decoration: InputDecoration(
                hintText: hint,
                errorMaxLines: 2,
                errorStyle: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.error,
                    fontSize: 10.0,
                    height: 1.5,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                suffixIcon: obscureText != null
                    ? GestureDetector(
                        onTap: () => onSuffixIconClick?.call(!obscureText!),
                        child: Icon(
                            obscureText!
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 27.0))
                    : null),
            keyboardType: textInputType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            validator: validator,
            onSubmitted: onSubmitted,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            autovalidateMode: autoValidateMode,
          ),
        ),
      ],
    );
  }
}

class CustomInputFieldUi extends StatelessWidget {
  final String? title;
  final String? name;
  final TextEditingController? controller;
  final String hint;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int maxLines;
  final bool? obscureText;
  final AutovalidateMode autoValidateMode;
  final String? leadingAssets;
  final Color? leadingColor;
  final Widget Function(BuildContext, Object, StackTrace?)? onImageError;
  final void Function(bool)? onSuffixIconClick;

  const CustomInputFieldUi({
    super.key,
     this.name,
    this.title,
    this.controller,
    this.hint = '',
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.none,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.leadingAssets,
    this.leadingColor,
    this.onImageError,
    this.onSuffixIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        sizeBox10,
        if (title != null)
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(title ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600))),
        FormBuilderTextField(
          name: name??'',

          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              errorMaxLines: 2,
              errorStyle: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.error,
                  fontSize: 10.0,
                  height: 1.5,
                  fontWeight: FontWeight.w400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              suffixIcon: obscureText != null
                  ? GestureDetector(
                      onTap: () => onSuffixIconClick?.call(!obscureText!),
                      child: Icon(
                          obscureText!
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 27.0))
                  : null),
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          validator: validator,
          onSubmitted: onSubmitted,
          maxLines: maxLines,
          obscureText: obscureText ?? false,
          autovalidateMode: autoValidateMode,
        ),
      ],
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600)));
  }
}

