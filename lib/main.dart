import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/test_project.dart';

import 'app_setup/app_init.dart';

void main() => initializeApp();

Future initializeApp() async => runZonedGuarded(() async {
      await AppInit.initialize();
      runApp(const ProviderScope(child: TestProject()));
    }, (error, stack) {});
