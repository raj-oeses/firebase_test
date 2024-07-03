
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routers/app_routers.dart';
import 'core/utils/colors.dart';

class TestProject extends StatelessWidget {
  const TestProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'appName',
        getPages: AppRoutes.getPages,
        initialRoute: AppRoutes.APP_WIDGET,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            secondary: Colors.deepOrangeAccent),
        fontFamily: 'Popins',
        primaryColor: MaterialColor(
          AppColors.primaryColor.value,
          <int, Color>{
            50: AppColors.primaryColor.withOpacity(0.1),
            100: AppColors.primaryColor.withOpacity(0.2),
            200: AppColors.primaryColor.withOpacity(0.3),
            300: AppColors.primaryColor.withOpacity(0.4),
            400: AppColors.primaryColor.withOpacity(0.5),
            500: AppColors.primaryColor.withOpacity(0.6),
            600: AppColors.primaryColor.withOpacity(0.7),
            700: AppColors.primaryColor.withOpacity(0.8),
            800: AppColors.primaryColor.withOpacity(0.9),
            900: AppColors.primaryColor.withOpacity(1.0),
          },
        ),
        primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          <int, Color>{
            50: AppColors.primaryColor.withOpacity(0.1),
            100: AppColors.primaryColor.withOpacity(0.2),
            200: AppColors.primaryColor.withOpacity(0.3),
            300: AppColors.primaryColor.withOpacity(0.4),
            400: AppColors.primaryColor.withOpacity(0.5),
            500: AppColors.primaryColor.withOpacity(0.6),
            600: AppColors.primaryColor.withOpacity(0.7),
            700: AppColors.primaryColor.withOpacity(0.8),
            800: AppColors.primaryColor.withOpacity(0.9),
            900: AppColors.primaryColor.withOpacity(1.0),
          },
        ),
        secondaryHeaderColor: Colors.deepOrangeAccent,
      ));
  }
}
