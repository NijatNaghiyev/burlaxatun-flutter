import 'dart:developer';

import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.focusedDay,
  });

  final DateTime focusedDay;

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        border: Border.all(color: Colors.black38),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (day) {
            log('DAY: $day');
            return isSameDay(questionsCubit.selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            questionsCubit.updateSelectedDay(selectedDay);
            // log('selected day: $selectedDay');
            // log('focused day: $focusedDay');
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
          calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                color: ColorConstants.primaryColor,
              ),
              todayTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xff667085),
                fontWeight: FontWeight.w400,
              ),
              weekendTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xff667085),
                fontWeight: FontWeight.w400,
              ),
              defaultTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xff667085),
                fontWeight: FontWeight.w400,
              ),
              cellMargin: EdgeInsets.all(9)),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: Color(0xffD0D5DD),
              fontWeight: FontWeight.w600,
            ),
            weekendStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: Color(0xffD0D5DD),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
