import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class DoctorNotificationStatus extends StatelessWidget {
  const DoctorNotificationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffFEE4E2),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: GlobalText(
            height: 1.4,
            textAlign: TextAlign.left,
            text:
                'Təəsüfki, qeyd ettiyiniz tarix həkim tərəfindən qəbul edilmədi.',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xffF04438),
          ),
        ),
      ),
    );
  }
}
