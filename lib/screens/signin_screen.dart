import 'package:anime_verse/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Center(
        child: Text(
          'Sign In Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
