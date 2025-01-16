import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/registration_calendar_widget.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/time_widget.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class RegistrationDateAndTimeWidget extends StatelessWidget {
  const RegistrationDateAndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: 'Uyğun Tarix və Vaxt',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
        32.h,
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  TimeWidget(),
                  RegistrationCalendarWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
