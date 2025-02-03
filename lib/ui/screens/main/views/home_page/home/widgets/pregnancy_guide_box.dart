import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../widgets/global_text.dart';

class PregnancyGuideBox extends StatelessWidget {
  const PregnancyGuideBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isCheckedGuideBoxNotifier =
        ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: isCheckedGuideBoxNotifier,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            isCheckedGuideBoxNotifier.value = !isCheckedGuideBoxNotifier.value;
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 21, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        height: 1.3,
                        textAlign: TextAlign.left,
                        text: 'Fol turşusunun qəbulu',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff484848),
                      ),
                      SizedBox(
                        width: 226,
                        child: GlobalText(
                          height: 1.3,
                          textAlign: TextAlign.left,
                          text:
                              'Hamilə qadına gün ərzində 600-800 mkq fol turşusu lazımdır',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff484848),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Checkbox(
                      side: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      splashRadius: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: ColorConstants.primaryColor,
                      value: value,
                      onChanged: (v) {
                        isCheckedGuideBoxNotifier.value = v!;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
