import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/resume.png',
      width: 129,
      height: 126,
    );
  }
}
