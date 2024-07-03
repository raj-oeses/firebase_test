import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        'LOGO',
        style: context.textTheme.labelSmall?.copyWith(
          fontSize: 30,
          color: context.textTheme.bodySmall?.color,
        ),
      ),
    );
  }
}
