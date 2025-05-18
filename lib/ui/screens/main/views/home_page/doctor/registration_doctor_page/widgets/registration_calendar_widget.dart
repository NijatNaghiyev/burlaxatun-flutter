import 'package:burla_xatun/cubits/doctor_reservation/doctor_reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class RegistrationCalendarWidget extends StatelessWidget {
  const RegistrationCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorReservationCubit doctorReservationCubit =
        context.read<DoctorReservationCubit>();

    final ValueNotifier<DateTime> selectedDayNotifier =
        ValueNotifier<DateTime>(DateTime.now());
    return ValueListenableBuilder(
      valueListenable: selectedDayNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TableCalendar(
            rowHeight: 48,
            focusedDay: value,
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            selectedDayPredicate: (day) {
              return isSameDay(value, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              selectedDayNotifier.value = focusedDay;
              final formattedDay =
                  DateFormat('yyyy-MM-dd').format(selectedDayNotifier.value);
              doctorReservationCubit.saveDate(formattedDay);
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              cellPadding: EdgeInsets.zero,
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                color: ColorConstants.primaryRedColor,
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
      },
    );
  }
}
