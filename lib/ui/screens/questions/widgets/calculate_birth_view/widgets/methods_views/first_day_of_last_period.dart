import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class FirstDayOfLastPeriod extends StatefulWidget {
  const FirstDayOfLastPeriod({super.key});

  @override
  State<FirstDayOfLastPeriod> createState() => _FirstDayOfLastPeriodState();
}
class _FirstDayOfLastPeriodState extends State<FirstDayOfLastPeriod> {
  // late final ScrollController _scrollController;
  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: 'Period muddetini secin',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff667085),
            ),
          ],
        ),
        10.h,
        GestureDetector(
          onTap: () {
            // questionsCubit.showDaysToggle();
            questionsCubit.scrollBottom();
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
                    BlocBuilder<QuestionsCubit, QuestionsState>(
                      builder: (context, state) {
                        return GlobalText(
                          text: questionsCubit.selectedPeriodTime,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        );
                      },
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
                ? Column(
                    children: [
                      SizedBox(
                        height: 252,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              child: ColoredBox(
                                color: Color(0xffFFECF2),
                                child: SizedBox(
                                  height: 58,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 120),
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
                            ListWheelScrollView(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BlocBuilder<QuestionsCubit,
                                            QuestionsState>(
                                          builder: (context, state) {
                                            log('$i index change its color updated');
                                            return GlobalText(
                                              text: '$i',
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                              color: questionsCubit
                                                          .focusedWeekIndex ==
                                                      i
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
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
