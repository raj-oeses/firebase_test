import 'package:flutter/material.dart';
import 'package:test_project/feature/new_assessment_page/pages/new_assessment_page.dart';

import '../../../core/widgets/custom_button.dart';
import '../../assessment_page/pages/assessment_page.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const HomeBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShadowButton(
              isDisable: false,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewAssessmentPage())),
              text: 'New assessment',
              icon: Icons.add),
        ));
  }
}
