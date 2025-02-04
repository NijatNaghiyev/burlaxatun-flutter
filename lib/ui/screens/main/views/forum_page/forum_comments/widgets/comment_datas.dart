import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class CommentDatas extends StatelessWidget {
  const CommentDatas({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/png/comment_user_pic.png',
          width: 44,
          height: 44,
        ),
        SizedBox(width: 10),
        SizedBox(
          width: context.deviceWidth * 0.69,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: '@AngelaMayer',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  GlobalText(
                    text: '3 hours ago',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ],
              ),
              6.h,
              GlobalText(
                height: 1.4,
                textAlign: TextAlign.left,
                text:
                    'This sunflower is so vibrant! The colors just pop. It makes me feel so cheerful!',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ],
          ),
        )
      ],
    );
  }
}
