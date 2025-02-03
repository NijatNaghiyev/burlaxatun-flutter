import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class QuestionBox extends StatelessWidget {
  QuestionBox({
    super.key,
    required this.index,
  });

  final int index;

  final isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  log('tapped index: $index');
                  isExpanded.value = !isExpanded.value;
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: context.deviceWidth * 0.69,
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
                    ValueListenableBuilder(
                      valueListenable: isExpanded,
                      builder: (context, value, child) {
                        return SvgPicture.asset(
                          isExpanded.value
                              ? 'assets/icons/minus_icon.svg'
                              : 'assets/icons/plus_icon.svg',
                        );
                      },
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: isExpanded,
                builder: (context, value, child) {
                  log('listenable builder');
                  return isExpanded.value
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
    );
  }
}

// BlocBuilder<MainnCubit, MainInitial>(
//                   builder: (context, state) {
//                     return state.isShowQuestion &&
//                             state.selectedQuestionBox == widget.index
//                         ? Column(
//                             children: [
//                               15.h,
//                               ColoredBox(
//                                 color: Color(0xffE4E4E4),
//                                 child: SizedBox(
//                                   height: 1,
//                                   width: MediaQuery.of(context).size.width,
//                                 ),
//                               ),
//                               15.h,
//                               GlobalText(
//                                 height: 1.8,
//                                 textAlign: TextAlign.left,
//                                 text:
//                                     'Körpəniz 7 və ya 8-ci həftədən etibarən müxtəlif istigamətlərə əyilir ve gərilir, lakin 16-ci - 24-cü həftəyədək hərəkətlər sizin tərəfinizdən hiss edilməyəcəkdir.',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               ),
//                             ],
//                           )
//                         : SizedBox.shrink();
//                   },
//                 ),
