import 'package:flutter/material.dart';
import 'package:mt_hancod/presenentation/auth/widgets/connect_with_google_buton.dart';
import 'package:mt_hancod/presenentation/auth/widgets/custom_green_button.dart';
import 'package:mt_hancod/presenentation/auth/widgets/logo_.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            const Logo(),
            ConnectwithGoogleButon(onTap: () {}),
            CustomGreenButon(onTap: () {})
          ],
        ),
      ),
    );
  }
}
