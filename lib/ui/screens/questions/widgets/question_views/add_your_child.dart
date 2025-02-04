import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/extensions/context_extensions.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_input.dart';
import '../../../../widgets/global_text.dart';
import 'pick_birth_date_widget.dart';

class AddYourChild extends StatelessWidget {
  const AddYourChild({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return SingleChildScrollView(
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            spacing: context.deviceHeight < 700 ? 15 : 20,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.deviceHeight < 710 ? 14 : 28),
                child: GlobalText(
                  text: 'Övladınızı əlavə edin',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              GlobalInput(
                onFieldSubmitted: (v) {
                  questionCubit.showBirthDateBottomSheet(context, PickBirthDateWidget());
                },
                inputName: 'Tam Ad',
                prefixIcon: 'assetsicon/child_user.svg',
                hintText: 'Tam adını qeyd edin',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    text: 'Doğum Tarixi',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  context.deviceHeight < 750 ? 8.h : 16.h,
                  GestureDetector(
                    onTap: () {
                      questionCubit.showBirthDateBottomSheet(
                          context, PickBirthDateWidget());
                    },
                    child: SizedBox(
                      width: context.deviceWidth,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(34)),
                          border: Border.all(
                            color: ColorConstants.enabledInputColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16) +
                              EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/calendar_svg.svg'),
                              SizedBox(width: 12),
                              BlocBuilder<QuestionsCubit, QuestionsInitial>(
                                buildWhen: (previous, current) {
                                  return previous.birthDateString !=
                                      current.birthDateString;
                                },
                                builder: (context, state) {
                                  return GlobalText(
                                    text: state.birthDateString,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GlobalInput(
                focusNode: questionCubit.childWeightFocusNode,
                inputName: 'Çəki',
                prefixIcon: AssetConstants.weightIcon,
                hintText: 'Çəkisini qeyd edin',
                onFieldSubmitted: (v) {
                  questionCubit.childHeightFocusNode.requestFocus();
                },
              ),
              GlobalInput(
                focusNode: questionCubit.childHeightFocusNode,
                inputName: 'Boy',
                prefixIcon: AssetConstants.heightIcon,
                hintText: 'Boyunu qeyd edin',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
