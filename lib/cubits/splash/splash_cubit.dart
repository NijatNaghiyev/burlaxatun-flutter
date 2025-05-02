import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/services/local/login_token_service.dart';
import '../../utils/di/locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splahsMethod() async {
    final loginTokenService = locator<LoginTokenService>();
    final bool isLoggedIn = await loginTokenService.isUserLoggedIn();
    
    // Check if onboarding has been shown before
    final bool onboardingShown = await _isOnboardingShown();

    if (isLoggedIn) {
      emit(SplashSuccess()); // Navigate to home if logged in
    } else if (!onboardingShown) {
      emit(SplashAuth()); // Navigate to onboarding
    } else {
      emit(SplashLogin()); // Navigate to login directly
    }
  }
  
  Future<bool> _isOnboardingShown() async {
    try {
      final onboardingBox = await Hive.openBox<bool>('onboarding_prefs');
      return onboardingBox.get('onboarding_shown') ?? false;
    } catch (e) {
      log('Error checking onboarding status: $e');
      return false;
    }
  }
}
