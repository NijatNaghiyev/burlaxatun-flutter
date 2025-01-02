import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class FirstDayOfLastPeriod extends StatelessWidget {
  const FirstDayOfLastPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: 'Period müddəti',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff667085),
            ),
          ],
        ),
        10.h,
        GestureDetector(
          onTap: () {
            questionsCubit.showDaysToggle();
          },
          child: SizedBox(
            width: double.maxFinite,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(34)),
                border: Border.all(color: Colors.black38),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalText(
                      text: 'Period müddəti seçin...',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    BlocBuilder<QuestionsCubit, QuestionsState>(
                      builder: (context, state) {
                        return SvgPicture.asset(
                          questionsCubit.showDays
                              ? AssetConstants.arrowUpIcon
                              : AssetConstants.arrowDownIcon,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        10.h,
        BlocBuilder<QuestionsCubit, QuestionsState>(
          builder: (context, state) {
            return questionsCubit.showDays
                ? SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListWheelScrollView(
                      overAndUnderCenterOpacity: 0.5,
                      onSelectedItemChanged: (i) {
                        // questionsCubit.updateFocusedWeekIndex(i);
                      },
                      itemExtent: 58,
                      children: [
                        for (int i = 0; i < 10; i++)
                          ColoredBox(
                            color: questionsCubit.focusedWeekIndex == i
                                ? Color(0xffFFECF2)
                                : Colors.transparent,
                            child: SizedBox(
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
                                        text: 'Gün',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
