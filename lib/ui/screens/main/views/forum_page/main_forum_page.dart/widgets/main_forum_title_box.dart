import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class MainForumTitleBox extends StatelessWidget {
  const MainForumTitleBox({
    super.key,
    required this.title,
    this.topicCount,
    this.messageCount,
    this.viewsCount,
    this.onTap,
  });

  final String title;
  final int? topicCount;
  final int? messageCount;
  final int? viewsCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.deviceWidth * 0.58,
                    child: GlobalText(
                      textAlign: TextAlign.left,
                      text: title,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  25.h,
                  Row(
                    children: [
                      GlobalText(
                        textAlign: TextAlign.left,
                        text: '$topicCount mövzu',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      SizedBox(width: 14),
                      GlobalText(
                        textAlign: TextAlign.left,
                        text: '$messageCount mesaj',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                'assets/png/main_forum_png.png',
                width: 92,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
