import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../widgets/global_text.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Row(
              children: [
                SizedBox(
                  width: 43.33,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          i == 3 ? ColorConstants.primaryColor : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          GlobalText(
                            text: 'Wed',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: i == 3 ? Colors.white : Colors.black,
                          ),
                          GlobalText(
                            text: '$i',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: i == 3 ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
              ],
            );
          },
        ),
      ),
    );
  }
}
