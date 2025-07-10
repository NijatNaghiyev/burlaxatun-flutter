import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import 'setting_box.dart';

class SettingBoxes extends StatelessWidget {
  const SettingBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SettingBox(
              rightWidget: i != 0
                  ? SvgPicture.asset('assets/icons/arrow_right.svg')
                  : CupertinoSwitch(
                      dragStartBehavior: DragStartBehavior.down,
                      value: true,
                      onChanged: (v) {},
                    ),
              boxIcon: mainCubit.settingItems[i].icon,
              boxName: mainCubit.settingItems[i].settingName,
              onTap: () => mainCubit.tapSettingTile(context, i),
            ),
          ),
      ],
    );
  }
}
