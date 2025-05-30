import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:flutter/material.dart';

import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import 'widgets/add_child_or_im_pregnant_button.dart';
import 'widgets/child_account_box.dart';

class GlobalChangeBabyBottomsheet extends StatelessWidget {
  const GlobalChangeBabyBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final children = locator<UserDataCubit>().state.response?.babies ?? [];
    return SizedBox(
      width: context.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              24.h,
              if (children.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text('there is no any child'),
                )
              else
                for (int i = 0; i < 3; i++) ...[
                  ChildAccountBox(
                    babyName: children[i].name ?? 'baby name not found',
                  ),
                  12.h,
                ],
              24.h,
              AddChildOrImPregnantButton(),
              33.h,
            ],
          ),
        ),
      ),
    );
  }
}
