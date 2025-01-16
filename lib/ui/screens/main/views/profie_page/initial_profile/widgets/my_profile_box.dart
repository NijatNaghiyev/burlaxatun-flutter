import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class MyProfileBox extends StatelessWidget {
  const MyProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    text: 'Hesabim',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
              32.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Adınız',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: 'Aysel',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                    color: Color(0xffF2F4F7),
                    child: SizedBox(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Soyadınız',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: 'Aliyeva',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
              14.h,
               ColoredBox(
                    color: Color(0xffF2F4F7),
                    child: SizedBox(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Yaşınız',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: '2001-09-03',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Siz kimsiniz',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: 'Ana',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
