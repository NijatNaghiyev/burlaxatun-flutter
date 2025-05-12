import 'package:burla_xatun/data/models/remote/response/doctors_list_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';

class DoctorInfo extends StatelessWidget {
  final Result doctor;

  const DoctorInfo({super.key, required this.doctor});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          doctor.image ?? 'assets/png/doctor_image.png',
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
                  text: 'Dr. ${doctor.name} ${doctor.surname}',
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
                  text: doctor.position?.name ?? 'N/A',
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
                  text: doctor.workplace ?? 'N/A',
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
