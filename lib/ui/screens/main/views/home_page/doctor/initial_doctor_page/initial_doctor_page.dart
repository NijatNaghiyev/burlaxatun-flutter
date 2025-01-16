import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/doctor_box.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/doctor_categories.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/search_and_notification.dart';

class InitialDoctorPage extends StatelessWidget {
  const InitialDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      backgroundColor: Color(0xffFCFCFD),
      appBar: GlobalAppbar(
        title: 'Həkimlər',
        onTap: () {
          mainCubit.changeHomeView('Home');
          mainCubit.scrollLatestPositionHomePage();
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
                  DoctorBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
