import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class RegistrationCalendarWidget extends StatelessWidget {
  const RegistrationCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: TableCalendar(
        rowHeight: 48,
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        // selectedDayPredicate: (day) {
        //   return isSameDay(questionsCubit.selectedDay, day);
        // },
        onDaySelected: (selectedDay, focusedDay) {
          // questionsCubit.updateSelectedDay(selectedDay);
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
          cellPadding: EdgeInsets.zero,
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
          cellMargin: EdgeInsets.all(5),
        ),
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
    );
  }
}
