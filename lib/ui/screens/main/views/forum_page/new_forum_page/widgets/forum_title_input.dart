import '../../../../../../widgets/global_text.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'forum_input.dart';

class ForumTitleInput extends StatelessWidget {
  const ForumTitleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          text: 'Forum başlığı',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff595959),
        ),
        13.h,
        ForumInput(
          hintText: 'Başlığı qeyd edin',
        ),
      ],
    );
  }
}
