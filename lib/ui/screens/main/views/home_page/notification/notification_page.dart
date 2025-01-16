import 'package:flutter/material.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import 'widgets/last_days.dart';
import 'widgets/notification_appbar.dart';
import 'widgets/notification_box.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: NotificationAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            28.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LastDays(),
              ],
            ),
            24.h,
            NotificationBox(),
          ],
        ),
      ),
    );
  }
}
