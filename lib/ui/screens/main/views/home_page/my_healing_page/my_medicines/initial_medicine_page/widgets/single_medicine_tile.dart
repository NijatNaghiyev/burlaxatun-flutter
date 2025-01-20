import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_text.dart';
import '../../medicine_details_page/medicine_details_page.dart';

class SingleMedicineTile extends StatelessWidget {
  const SingleMedicineTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('tapped medicine tile');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MedicineDetailsPage(),
          ),
        );
      },
      child: SizedBox(
        height: 66,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffF7F7F7),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalText(
                      text: '24.09.2024-24.12.2024',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        GlobalText(
                          text: 'Daha etrafli',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff97989D),
                        ),
                        SizedBox(width: 7),
                        SvgPicture.asset(
                            'assets/icons/medicine_arrow_right_icon.svg'),
                      ],
                    ),
                  ],
                ),
                8.h,
                GlobalText(
                  text: 'Folic acid',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
