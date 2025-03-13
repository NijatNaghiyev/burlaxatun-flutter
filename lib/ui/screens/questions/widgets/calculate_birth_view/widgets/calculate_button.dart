import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../widgets/global_button.dart';
import 'calculation_result_dialog.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return BlocConsumer<QuestionsCubit, QuestionsInitial>(
      listener: (context, state) async {
        if (state.stateStatus == CalculateStateStatus.success) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: questionsCubit,
                child: CalculationResultDialog(),
              );
            },
          );
        } else if (state.stateStatus == CalculateStateStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error while calculating')),
          );
        }
      },
      builder: (context, state) {
        return GlobalButton(
          buttonName: state.stateStatus == CalculateStateStatus.loading
              ? 'Hesablanır ...'
              : 'Hesabla',
          buttonColor: ColorConstants.primaryColor,
          textColor: Colors.white,
          onPressed: () async {
            if (state.selectedCalculateOptionIndex == null) {
              questionsCubit.stateError();
            } else {
              questionsCubit.stateLoading();
              await questionsCubit.calculate();
            }
          },
        );
      },
    );
  }
}
