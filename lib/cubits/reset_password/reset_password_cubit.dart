import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_password_state.dart';

enum ResetPasswordStateStatus {
  initial,
  loading,
  otpSend,
  otpVerified,
  success,
  error
}

class ResetPasswordCubit extends Cubit<ResetPasswordInitial> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void sendOtp() {}

  void verifyOtp() {}

  void changePassword() {}
}
