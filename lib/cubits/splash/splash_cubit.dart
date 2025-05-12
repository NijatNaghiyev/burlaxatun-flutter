import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/local/token_hive_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splahsMethod() async {
    final String? token;
    token = await TokenHiveService.instance.getToken();

    token != null ? emit(SplashSuccess()) : emit(SplashAuth());
  }

  // void _isSeenOnboarding() {
  // hive check burada olacag 
  // }
}
