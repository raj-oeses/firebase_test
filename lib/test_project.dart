
import 'package:flutter/material.dart';

import 'feature/home_page/pages/home_page.dart';

class TestProject extends StatelessWidget {
  const TestProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'robotoMF',
            scaffoldBackgroundColor: const Color(0xfff4f4f4)),
        home: const HomePage());
  }
}
