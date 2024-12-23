import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_text.dart';

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Column(
        children: [
          GlobalText(
            text: 'Neçə həftəlik hamiləsiniz?',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          36.h,
          Stack(
            children: [
              Positioned(
                top: 129,
                child: ColoredBox(
                  color: Color(0xffFFECF2),
                  child: SizedBox(
                    height: 58,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: GlobalText(
                            text: 'həftəlik',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffEC407A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 318,
                width: double.maxFinite,
                child: ListWheelScrollView(
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (i) {
                    log(' hefte: $i');
                    questionsCubit.updateFocusedWeekIndex(i);
                  },
                  itemExtent: 57,
                  children: [
                    for (int i = 0; i < 10; i++)
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<QuestionsCubit, QuestionsState>(
                              builder: (context, state) {
                                log('$i index change its color updated');
                                return GlobalText(
                                  text: '$i',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                  color: questionsCubit.focusedWeekIndex == i
                                      ? Colors.pink
                                      : Color(0xffACACAC),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 28, left: 24),
            child: Row(
              children: [
                BlocBuilder<QuestionsCubit, QuestionsState>(
                  builder: (context, state) {
                    return Radio(
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      activeColor: ColorConstants.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      toggleable: true,
                      splashRadius: 0,
                      value: questionsCubit.iDontKnow,
                      groupValue: true,
                      onChanged: (v) {
                        questionsCubit.iDontKnowToggle(v ?? true);
                      },
                    );
                  },
                ),
                SizedBox(width: 12),
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
      ),
    );
  }
}
