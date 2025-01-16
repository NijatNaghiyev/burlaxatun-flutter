import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/global_appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Haqqımızda',
        onTap: () {
          mainCubit.goBackInitialProfileView();
        },
      ),
      body: Container(),
    );
  }
}
