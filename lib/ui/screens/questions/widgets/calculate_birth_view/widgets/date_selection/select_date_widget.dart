// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_svg/svg.dart';

// // import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
// // import '../../../../../../../cubits/questions_cubit/questions_state.dart';
// // import '../../../../../../../utils/constants/asset_constants.dart';
// // import '../../../../../../../utils/extensions/num_extensions.dart';
// // import '../../../../../../widgets/global_text.dart';

// // class SelectDateWidget extends StatelessWidget {
// //   const SelectDateWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final questionsCubit = context.read<QuestionsCubit>();
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             GlobalText(
// //               text: 'Tarix',
// //               fontSize: 14,
// //               fontWeight: FontWeight.w500,
// //               color: Color(0xff667085),
// //             ),
// //           ],
// //         ),
// //         10.h,
// //         GestureDetector(
// //           onTap: () {
// //             // questionsCubit.showCalendarToggle();
// //             questionsCubit.scrollBottomCalendar();
// //           },
// //           child: SizedBox(
// //             width: double.maxFinite,
// //             height: 56,
// //             child: DecoratedBox(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.all(Radius.circular(34)),
// //                 border: Border.all(color: Colors.black38),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     GlobalText(
// //                       text: 'Tarixi hesabla...',
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w500,
// //                       color: Colors.black,
// //                     ),
// //                     BlocBuilder<QuestionsCubit, QuestionsInitial>(
// //                       builder: (context, state) {
// //                         return SvgPicture.asset(
// //                           state.showCalendar
// //                               ? AssetConstants.arrowUpIcon
// //                               : AssetConstants.arrowDownIcon,
// //                         );
// //                       },
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';

// import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
// import '../../../../../../../cubits/questions_cubit/questions_state.dart';
// import '../../../../../../../utils/constants/asset_constants.dart';
// import '../../../../../../../utils/extensions/num_extensions.dart';
// import '../../../../../../widgets/global_text.dart';

// class SelectDateWidget extends StatelessWidget {
//   const SelectDateWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final questionsCubit = context.read<QuestionsCubit>();
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             GlobalText(
//               text: 'Tarix',
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: Color(0xff667085),
//             ),
//           ],
//         ),
//         10.h,
//         GestureDetector(
//           onTap: () {
//             questionsCubit.scrollBottomCalendar();
//           },
//           child: SizedBox(
//             width: double.maxFinite,
//             height: 56,
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(34)),
//                 border: Border.all(color: Colors.black38),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     BlocBuilder<QuestionsCubit, QuestionsInitial>(
//                       buildWhen: (previous, current) =>
//                           previous.selectedDay != current.selectedDay,
//                       builder: (context, state) {
//                         // Format the selected date to display
//                         String displayDate =
//                             DateFormat('yyyy-MM-dd').format(state.selectedDay);
//                         return GlobalText(
//                           text: displayDate,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         );
//                       },
//                     ),
//                     BlocBuilder<QuestionsCubit, QuestionsInitial>(
//                       buildWhen: (previous, current) =>
//                           previous.showCalendar != current.showCalendar,
//                       builder: (context, state) {
//                         return SvgPicture.asset(
//                           state.showCalendar
//                               ? AssetConstants.arrowUpIcon
//                               : AssetConstants.arrowDownIcon,
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();

    // Initialize the date format in the cubit when widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Format initial date when widget first builds to ensure we have a valid date
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(questionsCubit.state.selectedDay);
      if (questionsCubit.state.birthDateString == 'Dogum tarixini qeyd edinn') {
        questionsCubit.updateBirthDate(
            formattedDate, questionsCubit.state.selectedDay);
      }
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: 'Tarix',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff667085),
            ),
          ],
        ),
        10.h,
        GestureDetector(
          onTap: () {
            questionsCubit.scrollBottomCalendar();
          },
          child: SizedBox(
            width: double.maxFinite,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(34)),
                border: Border.all(color: Color(0xffEAEAEA)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<QuestionsCubit, QuestionsInitial>(
                      buildWhen: (previous, current) =>
                          previous.selectedDay != current.selectedDay ||
                          previous.birthDateString != current.birthDateString,
                      builder: (context, state) {
                        return GlobalText(
                          text: state.birthDateString ==
                                  'Dogum tarixini qeyd edinn'
                              ? DateFormat('yyyy-MM-dd')
                                  .format(state.selectedDay)
                              : state.birthDateString,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        );
                      },
                    ),
                    BlocBuilder<QuestionsCubit, QuestionsInitial>(
                      buildWhen: (previous, current) =>
                          previous.showCalendar != current.showCalendar,
                      builder: (context, state) {
                        return SvgPicture.asset(
                          state.showCalendar
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
