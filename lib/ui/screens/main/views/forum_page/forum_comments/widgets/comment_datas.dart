import 'package:burla_xatun/data/models/remote/response/forum_comments_model.dart';
import 'package:burla_xatun/utils/helper/time_ago_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class CommentDatas extends StatelessWidget {
  final Result comment;

  const CommentDatas({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/png/comment_user_pic.png',
          width: 44,
          height: 44,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: GlobalText(
                      text: '@${comment.user}',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Flexible(
                    child: GlobalText(
                      text: comment.createdAt != null
                          ? timeAgo(comment.createdAt!)
                          : '',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              6.h,
              GlobalText(
                height: 1.4,
                textAlign: TextAlign.left,
                text: comment.text ?? '',
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
