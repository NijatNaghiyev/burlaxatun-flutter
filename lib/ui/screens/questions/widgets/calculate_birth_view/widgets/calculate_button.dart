import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../widgets/global_button.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return GlobalButton(
      buttonName: 'Hesabla',
      buttonColor: ColorConstants.primaryColor,
      textColor: Colors.white,
      onPressed: () {
        questionsCubit.calculate(context);
      },
    );
  }
}
