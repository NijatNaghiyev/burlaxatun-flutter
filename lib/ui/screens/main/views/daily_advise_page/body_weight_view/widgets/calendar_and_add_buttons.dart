import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../widgets/global_text.dart';

class CalendarAndAddButtons extends StatelessWidget {
  const CalendarAndAddButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            mainCubit.showCalendar(context);
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/calendar_icon.svg'),
              SizedBox(width: 7),
              GlobalText(
                text: '3 dekabr 2024',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
          width: 127,
          child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: const WidgetStatePropertyAll(Colors.transparent),
              backgroundColor: WidgetStatePropertyAll(Color(0xffFFD3E2)),
            ),
            onPressed: () {
              log('message');
              mainCubit.showAddIndicator(context);
            },
            child: Row(
              spacing: 3,
              children: [
                GlobalText(
                  text: 'Elave et',
                  fontSize: 14,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primaryColor,
                ),
                SvgPicture.asset('assets/icons/add_icon.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
