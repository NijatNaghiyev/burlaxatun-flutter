import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/local/onboarding_items_model.dart';

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
      // context.go('/login');
      context.pushReplacement('/login');
    } else {
      pageController.animateToPage(
        (indexOfPage + 1).toInt(),
        duration: Durations.medium2,
        curve: Curves.bounceInOut,
      );
    }
  }
}
