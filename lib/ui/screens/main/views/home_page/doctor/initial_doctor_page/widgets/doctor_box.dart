import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/doctor_register_button.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/time_and_price_box.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'doctor_info.dart';

class DoctorBox extends StatelessWidget {
  const DoctorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(122, 242, 244, 247),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          child: Column(
            children: [
              DoctorInfo(),
              24.h,
              TimeAndPriceBox(),
              24.h,
              DoctorRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
