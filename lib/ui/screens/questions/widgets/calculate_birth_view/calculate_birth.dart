import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_appbar.dart';
import 'widgets/calculate_button.dart';
import 'widgets/calculate_methods/calculation_method_widget.dart';
import 'widgets/calculate_methods/calculation_options.dart';
import 'widgets/date_selection/calendar_widget.dart';
import 'widgets/date_selection/select_date_widget.dart';

class CalculateBirth extends StatelessWidget {
  const CalculateBirth({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Doğuşu hesabla',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
          child: Column(
            children: [
              CalculationMethodWidget(),
              BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return questionsCubit.showOptions
                      ? Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: CalculationOptions(),
                        )
                      : SizedBox.shrink();
                },
              ),
              20.h,
              SelectDateWidget(),
              BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return questionsCubit.showCalendar
                      ? Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: CalendarWidget(
                              focusedDay: questionsCubit.selectedDay),
                        )
                      : SizedBox.shrink();
                },
              ),
              20.h,
              BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return questionsCubit.calculationOptions[
                      questionsCubit.selectedOptionIndex ?? 0];
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32, left: 18, right: 18),
        child: CalculateButton(),
      ),
    );
  }
}
