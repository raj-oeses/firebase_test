import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/date_time_formatter.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/core/widgets/custom_image.dart';

const _imageSize = 42.0;

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomNetworkImage(
          imageUrl:
              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
          height: _imageSize,
          width: _imageSize,
          radius: _imageSize,
        ),
        widthBox10,
        Expanded(
          child: _details(
              minor: 'Welcome Back',
              major: 'Dr.Luka',
              crossAlignment: CrossAxisAlignment.start),
        ),
        _details(
            minor: DateTimeFormatter.getDay(DateTime.now()),
            major: DateTimeFormatter.formatDMy(DateTime.now()),
            crossAlignment: CrossAxisAlignment.end)
      ],
    );
  }

  _details(
          {required String minor,
          required String major,
          required CrossAxisAlignment crossAlignment}) =>
      Column(
        crossAxisAlignment: crossAlignment,
        children: [
          Text(
            minor,
            style: const TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.w500, color: grey600),
          ),
          Text(
            major,
            style: const TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.w700, color: black600),
          ),
        ],
      );
}
