
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderRadioUi extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;

  const GenderRadioUi({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: context.theme.primaryColor,
        ),
        Text(label),
      ],
    );
  }
}
