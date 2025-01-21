import 'package:flutter/material.dart';

import 'widgets/onboard_button.dart';
import 'widgets/onboard_dots.dart';
import 'widgets/onboard_page_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 121, bottom: 67),
          child: Stack(
            alignment: Alignment.center,
            children: [
              OnboardPageView(),
              Positioned(
                top: 330,
                child: OnboardDots(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        child: OnboardButton(),
      ),
    );
  }
}
