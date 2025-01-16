import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/registration_date_and_time_widget.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/registration_doctor_info.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/registration_price_and_time.dart';
import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationDoctorPage extends StatelessWidget {
  const RegistrationDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFD),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              RegistrationDoctorInfo(),
              32.h,
              RegistrationPriceAndTime(),
              40.h,
              RegistrationDateAndTimeWidget(),
              75.h,
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: GlobalButton(
          buttonName: 'Qeydiyyat',
          buttonColor: ColorConstants.primaryColor,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
