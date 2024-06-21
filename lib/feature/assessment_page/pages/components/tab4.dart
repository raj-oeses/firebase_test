import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_project/core/utils/colors.dart';

import '../../../../core/utils/properties.dart';
import 'heading_section.dart';

class Tab4 extends StatelessWidget {
  const Tab4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeBox30,
        const HeadingSection(title: 'Confirm the results'),
        sizeBox10,
        Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2)),
                ],
                border: Border.all(color: grey200, width: 1),
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: [
                CircularGraph(currentValue: 14, totalValue: 15),
                sizeBox10,
                Divider(color: grey200),
                sizeBox10,
                _resultTile(questions: "Question1", isRight: true),
                _resultTile(questions: "Question2", isRight: false),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('See All',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: orange500,
                          fontSize: 14.0)),
                ) //
              ],
            ))
      ],
    );
  }

  _resultTile({required String questions, bool? isRight}) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                questions,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: black600),
              ),
            ),
            Text(
              isRight ?? false ? 'Correct' : "Incorrect",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isRight ?? false ? correctColor : inCorrectColor),
            ),
          ],
        ),
      );
}

class CircularGraph extends StatelessWidget {
  final int currentValue;
  final int totalValue;

  const CircularGraph(
      {super.key, required this.currentValue, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    double percentage = currentValue / totalValue;

    return CircularPercentIndicator(
      radius: 65.0,
      lineWidth: 10.0,
      percent: percentage,
      animation: true,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$currentValue",
              style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                  color: black600)),
          Text("/$totalValue",
              style: const TextStyle(
                  fontSize: 12.0, color: grey600, fontWeight: FontWeight.w400))
        ],
      ),
      progressColor: Colors.teal,
      backgroundColor: const Color(0xfff4f4f5),
      circularStrokeCap: CircularStrokeCap.butt,
    );
  }
}
