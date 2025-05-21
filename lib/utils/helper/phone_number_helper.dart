import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/cubits/user_update/user_update_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberHelper {
  static void savePhoneNumber({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String? phoneNumber,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      if (phoneNumber != null) {
        context.read<UserUpdateCubit>().updateUser(phoneNumber: phoneNumber);
        context.read<UserDataCubit>().getUserData();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The number has been updated.')),
        );
      }
    }
  }
}
