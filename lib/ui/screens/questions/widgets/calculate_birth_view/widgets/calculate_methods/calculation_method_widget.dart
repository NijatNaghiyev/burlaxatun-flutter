import 'package:burla_xatun/cubits/questions_cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class CalculationMethodWidget extends StatelessWidget {
  const CalculationMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: 'Hesablama',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff667085),
            ),
          ],
        ),
        10.h,
        GestureDetector(
          child: SizedBox(
            height: 56,
            width: double.maxFinite,
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
                            text: questionsCubit.selectedCalculateOption,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          );
                      },
                    ),
                    BlocBuilder<QuestionsCubit, QuestionsState>(
                      builder: (context, state) {
                        return SvgPicture.asset(
                          questionsCubit.showOptions
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
          onTap: () {
            questionsCubit.showOptionsToggle();
          },
        ),
      ],
    );
  }
}
