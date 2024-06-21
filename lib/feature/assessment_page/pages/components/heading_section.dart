import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';

class HeadingSection extends StatelessWidget {
  final String title;

  const HeadingSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 24.0, color: black600),
      textAlign: TextAlign.center,
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final String description;
  final TextAlign? textAlign;

  const DescriptionSection(
      {super.key, required this.description, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(description,
        style: const TextStyle(
            color: grey600, fontWeight: FontWeight.w500, fontSize: 14.0),
        textAlign: textAlign ?? TextAlign.center);
  }
}

class ExpandableDescriptionSection extends StatelessWidget {
  final String description;
  final VoidCallback seeAllOnTap;
  final bool? showAll;

  const ExpandableDescriptionSection(
      {super.key,
      required this.description,
      required this.seeAllOnTap,
      this.showAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(description,
            style: const TextStyle(
                color: grey600, fontWeight: FontWeight.w500, fontSize: 14.0),
            maxLines: showAll ?? false ? null : 2,
            overflow: showAll ?? false ? null : TextOverflow.ellipsis,
            textAlign: TextAlign.justify),
        InkWell(
            onTap: seeAllOnTap,
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('See All',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: orange500,
                        fontSize: 14.0))))
      ],
    );
  }
}
