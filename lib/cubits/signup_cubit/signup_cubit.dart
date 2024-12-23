import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial(false));

  bool isChecked = false;

  void checkBoxToggle(bool v) {
    emit(SignupCubitInitial(v));
  }

  // void goToQuestions(context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => BlocProvider(
  //         create: (context) => QuestionsCubit(),
  //         child: Questions(),
  //       ),
  //     ),
  //   );
  // }
}
