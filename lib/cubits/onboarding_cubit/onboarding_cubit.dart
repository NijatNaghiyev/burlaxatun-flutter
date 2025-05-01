import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../data/models/local/onboarding_items_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  int indexOfPage = 0;
  final pageController = PageController();
  final onboardingItems = OnboardItemsModel.items;

  void updateIndexOfPage(int value) {
    indexOfPage = value;
    emit(indexOfPage);
  }

  void jumptTo(BuildContext context) {
    if (indexOfPage == onboardingItems.length - 1) {
      // Save that onboarding has been shown
      _markOnboardingAsShown();
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
  
  // Save that onboarding has been shown to local storage
  Future<void> _markOnboardingAsShown() async {
    try {
      final onboardingBox = await Hive.openBox<bool>('onboarding_prefs');
      await onboardingBox.put('onboarding_shown', true);
      log('Onboarding marked as shown');
    } catch (e) {
      log('Error saving onboarding status: $e');
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
