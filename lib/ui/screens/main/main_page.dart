import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/main/main_cubit.dart';
import '../../widgets/global_bottom_navbar/global_bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: BlocBuilder<MainCubit, int>(
          builder: (context, state) {
            return mainCubit.views[mainCubit.indexOfView];
          },
        ),
        bottomNavigationBar: GlobalBottomNavbar(),
      ),
    );
  }
}
