import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../../../../../../widgets/global_text.dart';
import '../../widgets/add_button.dart';

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
        AddButton(
          onPressed: () => mainCubit.showAddIndicator(context),
        ),
      ],
    );
  }
}
