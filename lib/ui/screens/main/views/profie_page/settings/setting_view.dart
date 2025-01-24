import 'package:burla_xatun/ui/screens/main/views/profie_page/settings/widgets/setting_boxes.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Tənzimləmələr',
        onTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            24.h,
            SettingBoxes(),
          ],
        ),
      ),
    );
  }
}
