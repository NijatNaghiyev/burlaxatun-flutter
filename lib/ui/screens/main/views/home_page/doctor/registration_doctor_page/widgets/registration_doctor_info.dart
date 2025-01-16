import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class RegistrationDoctorInfo extends StatelessWidget {
  const RegistrationDoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/png/doctor_image.png',
            width: 90,
            height: 90,
          ),
          12.h,
          GlobalText(
            text: 'Dr. Günel Kərimova',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          5.h,
          GlobalText(
            text: 'Gynecologist • Medistyle Hosbital',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff667085),
          ),
        ],
      ),
    );
  }
}
