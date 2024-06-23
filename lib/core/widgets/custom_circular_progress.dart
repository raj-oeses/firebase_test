import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? size;

  const CustomCircularProgress({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
            height: size ?? 50.0,
            width: size ?? 50.0,
            child:
            CircularProgressIndicator.adaptive(backgroundColor: black600),
          ),
        ),
      ],
    );
  }
}