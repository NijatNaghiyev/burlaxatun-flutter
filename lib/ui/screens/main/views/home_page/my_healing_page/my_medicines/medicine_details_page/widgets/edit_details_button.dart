import 'dart:developer';

import 'package:burla_xatun/data/models/remote/response/medicines_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../widgets/global_text.dart';

class EditDetailsButton extends StatelessWidget {
  final Result data;

  const EditDetailsButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SizedBox(
      height: 48,
      width: 117,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStatePropertyAll(
            BorderSide(color: ColorConstants.primaryRedColor),
          ),
        ),
        onPressed: () {
          log('show edit medicine message');
          mainCubit.showEditMedicine(context, data);
        },
        child: GlobalText(
          text: 'Düzəliş et',
          fontSize: 14,
          height: 1.1,
          fontWeight: FontWeight.w500,
          color: ColorConstants.primaryRedColor,
        ),
      ),
    );
  }
}
