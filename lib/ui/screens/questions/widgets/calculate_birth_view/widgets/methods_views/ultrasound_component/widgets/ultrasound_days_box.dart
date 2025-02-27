import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_text.dart';
import 'ultrasound_days_bottomsheet.dart';

class UltrasoundDaysBox extends StatelessWidget {
  const UltrasoundDaysBox({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          text: 'Gun',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff667085),
        ),
        10.h,
        GestureDetector(
          onTap: () {
            questionCubit.showDayCount(context, UltrasoundDaysBottomsheet());
          },
          child: SizedBox(
            height: 56,
            width: context.deviceWidth * 0.45,
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
                    BlocBuilder<QuestionsCubit, QuestionsInitial>(
                      builder: (context, state) {
                        return GlobalText(
                          text: state.ultrasoundDayCount == null
                              ? 'Gun sayi'
                              : state.ultrasoundDayCount.toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        );
                      },
                    ),
                    BlocBuilder<QuestionsCubit, QuestionsInitial>(
                      buildWhen: (previous, current) {
                        return previous.isShowUltrasoundDays !=
                            current.isShowUltrasoundDays;
                      },
                      builder: (context, state) {
                        return SvgPicture.asset(
                          state.isShowUltrasoundDays
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
      ],
    );
  }
}
