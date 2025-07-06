import 'dart:developer';

import 'package:burla_xatun/data/contractor/refresh_token_contract.dart';
import 'package:burla_xatun/data/models/remote/response/refresh_token_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/contractor/user_data_contractor.dart';
import '../../data/services/local/login_token_service.dart';
import '../../utils/di/locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.refreshTokenContracor) : super(SplashInitial());

  final RefreshTokenContract refreshTokenContracor;

  final loginTokenService = locator<LoginTokenService>();
  void splahsMethod() async {
    final userDataContractor = locator<UserDataContractor>();
    final bool isLoggedIn = await loginTokenService.isUserLoggedIn();

    // Check if onboarding has been shown before
    final bool onboardingShown = await _isOnboardingShown();

    if (isLoggedIn) {
      // try {
      //   await userDataContractor.getUserData();
      //   emit(SplashSuccess()); // Navigate to home if logged in
      // } catch (e) {
      //   await refreshToken();
      // }
      await userDataContractor.getUserData();
      emit(SplashSuccess()); // Navigate to home if logged in
    } else if (!onboardingShown) {
      emit(SplashAuth()); // Navigate to onboarding
    } else {
      emit(SplashLogin()); // Navigate to login directly
    }
  }

  Future<void> refreshToken() async {
    log('REFRESHING TOKEN PROCCESS');
    try {
      final refreshToken = loginTokenService.loginResponse?.refresh;

      final response =
          await refreshTokenContracor.refreshToken({'refresh': refreshToken});

      final refreshedTokens = RefreshTokenModel.fromJson(response.data);

      final updatedLoginResponse = loginTokenService.copyWith(
        refreshToken: refreshedTokens.refresh,
        accessToken: refreshedTokens.access,
      );

      await loginTokenService
          .saveLoginResponse(updatedLoginResponse); // updating tokens for local
      emit(SplashSuccess());
    } on DioException catch (e, s) {
      final connectionError = e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.sendTimeout;
      if (connectionError) return;

      // if (e.response?.statusCode == 401) {
      log('unauthorized refresh token: $e', stackTrace: s);
      loginTokenService.deleteSaveByKey('login');
      emit(SplashLogin());
      // }
    } catch (e, s) {
      log('Error occured while refreshing token: $e', stackTrace: s);
      emit(SplashLogin());
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

  // void _isSeenOnboarding() {
  // hive check burada olacag
  // }
}
