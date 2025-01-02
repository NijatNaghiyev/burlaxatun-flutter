import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class HomePageDailyAdvise extends StatelessWidget {
  const HomePageDailyAdvise({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            26.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlobalText(
                  textAlign: TextAlign.left,
                  text: 'Gündəlik Tövsiyyələr · 42 Gün',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8C8A8A),
                ),
              ],
            ),
            17.h,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: Image.asset('assets/png/advise_image.png'),
            ),
            16.h,
            GlobalText(
              textAlign: TextAlign.left,
              text: 'Dırnaqlarınıza dırnaq boyası çəkmək olarmı, yoxsa yox?',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            11.h,
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: GlobalText(
                  height: 1.3,
                  maxLines: 8,
                  textAlign: TextAlign.left,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff969BAB),
                ),
              ),
            ),
            16.h,
          ],
        ),
      ),
    );
  }
}
