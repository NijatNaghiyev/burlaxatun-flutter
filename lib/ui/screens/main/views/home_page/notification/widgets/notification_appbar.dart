import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../widgets/global_appbar.dart';

class NotificationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return GlobalAppbar(
      title: 'Bildirişlər',
      onTap: () async {
        mainCubit.changeHomeView('Home');
        mainCubit.scrollLatestPositionHomePage();
      },
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 70);
}
