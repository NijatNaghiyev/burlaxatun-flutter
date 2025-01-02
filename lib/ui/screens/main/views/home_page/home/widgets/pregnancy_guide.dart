import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/pregnancy_guide_box.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class PregnancyGuide extends StatelessWidget {
  const PregnancyGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    textAlign: TextAlign.end,
                    text: 'Hamiləlik Bələdçisi · 6.Həftə',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8C8A8A),
                  ),
                ],
              ),
              13.h,
              Column(
                spacing: 24,
                children: [
                  for (int i = 0; i < 3; i++) PregnancyGuideBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
