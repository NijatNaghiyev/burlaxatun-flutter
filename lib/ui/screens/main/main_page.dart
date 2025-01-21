import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/global_bottom_navbar/global_bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
    required this.shellContext,
  });

  final StatefulNavigationShell navigationShell;
  final BuildContext shellContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainnCubit()..setShellContext(shellContext),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: navigationShell, // (navigationShell pagelerdir)
        bottomNavigationBar:
            GlobalBottomNavbar(navigationShell: navigationShell),
      ),
    );
  }
}

// indexed stack ve ya go router shell route


// BlocBuilder<MainnCubit, MainInitial>(
        //   builder: (context, state) {

        //     return mainCubit.views[state.indexOfView];
        //   },
        // ),
