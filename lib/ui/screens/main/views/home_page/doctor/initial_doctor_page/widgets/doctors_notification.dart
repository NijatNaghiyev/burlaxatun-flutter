import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';
import 'doctors_notification_box_widget.dart';

class DoctorsNotification extends StatelessWidget {
  const DoctorsNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 17, right: 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    text: 'Bildirişlər',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              24.h,
              DoctorsNotificationBoxWidget(),
              24.h,
              DoctorsNotificationBoxWidget(),
              24.h,
              DoctorsNotificationBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
