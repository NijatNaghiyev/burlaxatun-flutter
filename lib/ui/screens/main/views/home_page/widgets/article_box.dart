import 'package:flutter/material.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/global_text.dart';
import 'article_image.dart';

class ArticleBox extends StatelessWidget {
  const ArticleBox({
    super.key,
    this.playButton,
    this.onTap,
  });

  final Widget? playButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xffF2F4F7),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            child: Column(
              children: [
                ArticleImage(playButton: playButton),
                22.h,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GlobalText(
                    height: 1.2,
                    textAlign: TextAlign.left,
                    text: 'Doğuşdan Sonra Emosional və Fiziki Dəyişikliklər',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1D2939),
                  ),
                ),
                12.h,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GlobalText(
                    height: 1.2,
                    textAlign: TextAlign.left,
                    text:
                        'Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8C8A8A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
