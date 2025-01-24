import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/main/main_state.dart';
import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return RepaintBoundary(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    log('tapped index: $index');
                    mainCubit.isShowToggle(index);
                    mainCubit.updateSelectedQuestionBox(index);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 270,
                        child: GlobalText(
                          height: 1.5,
                          textAlign: TextAlign.left,
                          text: 'Körpəm hərətlərini nə zaman hiss edə bilərəm?',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      BlocBuilder<MainnCubit, MainInitial>(
                        builder: (context, state) {
                          log('is show quesion: ${state.isShowQuestion}');
                          log('index: ${state.selectedQuestionBox}');
                          return SvgPicture.asset(
                            state.isShowQuestion &&
                                    state.selectedQuestionBox == index
                                ? 'assets/icons/minus_icon.svg'
                                : 'assets/icons/plus_icon.svg',
                          );
                        },
                      )
                    ],
                  ),
                ),
                BlocBuilder<MainnCubit, MainInitial>(
                  builder: (context, state) {
                    return state.isShowQuestion &&
                            state.selectedQuestionBox == index
                        ? Column(
                            children: [
                              15.h,
                              ColoredBox(
                                color: Color(0xffE4E4E4),
                                child: SizedBox(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              15.h,
                              GlobalText(
                                height: 1.8,
                                textAlign: TextAlign.left,
                                text:
                                    'Körpəniz 7 və ya 8-ci həftədən etibarən müxtəlif istigamətlərə əyilir ve gərilir, lakin 16-ci - 24-cü həftəyədək hərəkətlər sizin tərəfinizdən hiss edilməyəcəkdir.',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          )
                        : SizedBox.shrink();
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
