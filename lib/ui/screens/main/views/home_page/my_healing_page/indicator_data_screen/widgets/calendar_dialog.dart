import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 480,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset('assets/icons/close_icon.svg'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              20.h,
              Material(
                type: MaterialType.card,
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true
                  ),
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
