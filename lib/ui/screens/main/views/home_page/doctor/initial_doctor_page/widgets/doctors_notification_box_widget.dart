import 'package:flutter/material.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';
import 'doctor_notification_status.dart';
import 're_registration_button.dart';

class DoctorsNotificationBoxWidget extends StatelessWidget {
  const DoctorsNotificationBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(122, 242, 244, 247),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          child: Column(
            children: [
              //DoctorInfo(),
              24.h,
              DoctorNotificationStatus(),
              24.h,
              ReRegistrationButton(),
            ],
          ),
        ),
      ),
    );
  }
}
