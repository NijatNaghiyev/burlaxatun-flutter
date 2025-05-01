import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/global_button.dart';
import '../../../../../widgets/global_text.dart';

class CalculationResultDialog extends StatelessWidget {
  const CalculationResultDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Center(
      child: SizedBox(
        width: 313,
        height: 349,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(38)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 21.7, vertical: 24.5),
            child: Column(
              children: [
                SvgPicture.asset('assets/svgs/baby_size.svg'),
                55.h,
                GlobalText(
                  height: 1.4,
                  text:
                      'Siz hamiləliyinizin ${questionsCubit.calculatedData.weeks} həftəsindəsiniz',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                12.h,
                GlobalText(
                  text: 'Körpəniz isə Alma boydadır!',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                17.h,
                GlobalButton(
                  buttonName: 'Davam et',
                  buttonColor: ColorConstants.primaryRedColor,
                  textColor: Colors.white,
                  height: 44,
                  onPressed: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
