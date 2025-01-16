import '../../../../../../../widgets/global_text.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/png/doctor_image.png',
          width: 40,
          height: 40,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlobalText(
                  text: 'Dr. Günel Kərimova',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
            7.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlobalText(
                  text: 'Ginekolog',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 4),
                GlobalText(
                  text: '• ',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 4),
                GlobalText(
                  text: 'Medistyle Hosbital',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
