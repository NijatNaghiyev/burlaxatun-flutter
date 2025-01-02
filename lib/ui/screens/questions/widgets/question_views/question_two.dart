import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_text.dart';

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Column(
      children: [
        GlobalText(
          text: 'Neçə həftəlik hamiləsiniz?',
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        36.h,
        SizedBox(
          height: 318,
          width: double.maxFinite,
          child: ListWheelScrollView(
            overAndUnderCenterOpacity: 0.5,
            onSelectedItemChanged: (i) {
              log(' hefte: $i');
              questionsCubit.updateFocusedWeekIndex(i);
            },
            itemExtent: 58,
            children: [
              for (int i = 0; i < 10; i++)
                SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalText(
                          text: '$i',
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GlobalText(
                            text: 'həftəlik',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 74),
          child: Row(
            children: [
              BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return Radio(
                    toggleable: true,
                    value: questionsCubit.iDontKnow,
                    groupValue: true,
                    onChanged: (v) {
                      questionsCubit.iDontKnowToggle(v ?? true);
                    },
                  );
                },
              ),
              GlobalText(
                text: 'Bilmirəm',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )
            ],
          ),
        ),
      ],
    );
  }
}
