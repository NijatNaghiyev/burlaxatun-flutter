import 'package:burla_xatun/ui/screens/main/views/home_page/doctor/registration_doctor_page/widgets/date_or_price_box.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class RegistrationPriceAndTime extends StatelessWidget {
  const RegistrationPriceAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffF2F4F7),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              DateOrPriceBox(
                  boxName: 'Uyğun Tarix',
                  boxInfo: 'Monday to Friday | 9:00 - 15:00'),
              26.h,
              DateOrPriceBox(boxName: 'Müayinə Qiyməti', boxInfo: '52 AZN'),
            ],
          ),
        ),
      ),
    );
  }
}
