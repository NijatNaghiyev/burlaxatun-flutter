import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class BabyInfoBox extends StatelessWidget {
  const BabyInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      width: 96,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Color(0xffF1F5F8),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                text: 'Boxname',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8C8A8A),
              ),
              GlobalText(
                text: 'data',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
