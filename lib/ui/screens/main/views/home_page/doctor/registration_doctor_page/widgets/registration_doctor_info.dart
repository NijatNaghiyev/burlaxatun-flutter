import 'package:flutter/material.dart';

import '../../../../../../../../data/models/remote/response/doctor_detail_model.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';

class RegistrationDoctorInfo extends StatelessWidget {
  final DoctorDetailResponse doctor;

  const RegistrationDoctorInfo({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(
            doctor.image ??
                'default_image_url', // Default image URL for fallback
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          12.h,
          GlobalText(
            text: '${doctor.name ?? ''} ${doctor.surname ?? ''}',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          5.h,
          GlobalText(
            text: '${doctor.position?.name ?? ''} • ${doctor.workplace ?? ''}',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff667085),
          ),
        ],
      ),
    );
  }
}
