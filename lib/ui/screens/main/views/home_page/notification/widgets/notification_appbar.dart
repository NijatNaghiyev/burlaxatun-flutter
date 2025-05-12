import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../widgets/global_appbar.dart';

class NotificationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return GlobalAppbar(
      title: 'Bildirişlər',
      onLeadingTap: () {
        // mainCubit.changeHomeView('Home');
        context.pop();
      },
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 70);
}
