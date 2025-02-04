import 'package:flutter/material.dart';

import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import 'widgets/add_child_or_im_pregnant_button.dart';
import 'widgets/child_account_box.dart';

class GlobalChangeBabyBottomsheet extends StatelessWidget {
  const GlobalChangeBabyBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.4,
      width: context.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              24.h,
              ChildAccountBox(),
              24.h,
              ChildAccountBox(),
              24.h,
              AddChildOrImPregnantButton(),
            ],
          ),
        ),
      ),
    );
  }
}
