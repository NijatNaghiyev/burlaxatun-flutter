import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/local/onboarding_items_model.dart';
import '../../ui/screens/auth/login/login.dart';

class OnboardingCubit extends Cubit<double> {
  OnboardingCubit() : super(0);

  double indexOfPage = 0;
  final pageController = PageController();
  final onboardingItems = OnboardItemsModel.items;

  void updateIndexOfPage(double value) {
    indexOfPage = value;
    emit(indexOfPage);
  }

  void jumptTo(BuildContext context) {
    if (indexOfPage == onboardingItems.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      pageController.animateToPage(
        (indexOfPage + 1).toInt(),
        duration: Durations.medium2,
        curve: Curves.bounceInOut,
      );
    }
  }
}
