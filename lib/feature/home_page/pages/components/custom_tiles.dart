import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/date_time_formatter.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/feature/home_page/data/model/history_model.dart';
import 'package:test_project/feature/new_assessment_page/pages/new_assessment_page.dart';

const _periodSize = 5.0;

class HistoryTile extends StatelessWidget {
  final HistoryModel? data;

  const HistoryTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                    color: const Color(0xff4D6FE7).withOpacity(.12),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Text(
                      data?.sn ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: blue700),
                    ),
                    widthBox10,
                    const Period(color: blue700),
                    widthBox10,
                    Expanded(
                      child: Text(data?.testName ?? '',
                          style: const TextStyle(color: blue700)),
                    ),
                  ],
                ),
              ),
            ),
            widthBox20,
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: blue700,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBox10,
            Text(
              data?.name ?? '',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            sizeBox5,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _dataText(data?.gender),
                      widthBox5,
                      Period(color: Colors.grey.shade400),
                      widthBox5,
                      _dataText('${data?.age} Years old'),
                      widthBox5,
                      Period(color: Colors.grey.shade400),
                      widthBox5,
                      _dataText('${data?.weight} kg'),
                      widthBox5,
                    ],
                  ),
                ),
                _dataText(DateTimeFormatter.dateFormatDMY(data?.date)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _dataText(String? title) => Text(
        title ?? '',
        style: const TextStyle(
            color: Color(0xff6C7278),
            fontWeight: FontWeight.bold,
            fontSize: 14.0),
      );
}

class RecentAssessmentTile extends StatelessWidget {
  final HistoryModel? data;

  const RecentAssessmentTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: const Color(0xffE7974D).withOpacity(.12),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                children: [
                  Text(data?.sn ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: orange600,
                          fontSize: 14.0)),
                  widthBox10,
                  const Period(color: orange600),
                  widthBox10,
                  Expanded(
                    child: Text(data?.testName ?? '',
                        style: const TextStyle(color: orange600)),
                  ),
                ],
              ),
            ),
          ),
          widthBox20,
          InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewAssessmentPage())),
              child: const Icon(Icons.arrow_circle_right_outlined,
                  color: orange600))
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Heading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1C1E))),
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text('See more',
                    style:
                        TextStyle(color: grey600, fontWeight: FontWeight.w700)),
                widthBox5,
                Icon(
                  Icons.arrow_forward,
                  color: grey600,
                  size: 20.0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Period extends StatelessWidget {
  final Color? color;

  const Period({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _periodSize,
      width: _periodSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_periodSize),
          color: color ?? Colors.white),
    );
  }
}
