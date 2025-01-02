import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class PregnancyGuideBox extends StatelessWidget {
  const PregnancyGuideBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 226,
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      textAlign: TextAlign.left,
                      text: 'Fol turşusunun qəbulu',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff484848),
                    ),
                    GlobalText(
                      textAlign: TextAlign.left,
                      text:
                          'Hamilə qadına gün ərzində 600-800 mkq fol turşusu lazımdır',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff484848),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Checkbox(
                  value: false,
                  onChanged: (v) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
