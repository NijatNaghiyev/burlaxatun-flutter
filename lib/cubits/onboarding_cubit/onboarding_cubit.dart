import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/local/onboarding_items_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  int indexOfPage = 0;
  late final PageController pageController;
  final onboardingItems = OnboardItemsModel.items;

  void updateIndexOfPage(int value) {
    indexOfPage = value;
    emit(indexOfPage);
  }

  void jumptTo(BuildContext context) {
    if (indexOfPage == onboardingItems.length - 1) {
      context.go('/login');
    } else {
      indexOfPage += 1;
      pageController.animateToPage(
        indexOfPage,
        duration: Durations.medium2,
        curve: Curves.linear,
      );
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
