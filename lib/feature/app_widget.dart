import 'package:flutter/material.dart';

import 'auth/pages/provider/firebase_auth.dart';
import 'auth/pages/signin_screen/pages/signin_screen.dart';
import 'landing_page/presentation/presentation/landing_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChange,
        builder: (_, snapshot) =>
            snapshot.hasData ? const LandingPage() : const SignInScreen());
  }
}
