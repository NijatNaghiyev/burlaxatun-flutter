import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../widgets/global_appbar.dart';

class MyMedicinesPage extends StatelessWidget {
  const MyMedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Dermanlarim',
        onTap: () {
          mainCubit.changeHomeView('Home');
          mainCubit.scrollLatestPositionHomePage();
        },
      ),
      body: Container(),
    );
  }
}
