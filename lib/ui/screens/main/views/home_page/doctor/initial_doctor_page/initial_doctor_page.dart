import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/doctor_box.dart';
import 'widgets/doctor_categories.dart';
import 'widgets/search_and_notification.dart';

class InitialDoctorPage extends StatelessWidget {
  const InitialDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      backgroundColor: Color(0xffFCFCFD),
      appBar: GlobalAppbar(
        title: 'Həkimlər',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchAndNotification(),
            24.h,
            DoctorCategories(),
            16.h,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 13),
              child: Column(
                spacing: 24,
                children: [
                  DoctorBox(),
                  DoctorBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
