import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/main/main_state.dart';
import '../../../cubits/main/mainn_cubit.dart';
import '../../widgets/global_bottom_navbar/global_bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: BlocBuilder<MainnCubit, MainInitial>(
        // buildWhen: ,
        builder: (context, state) {
          
          return mainCubit.views[state.indexOfView];
        },
      ),
      bottomNavigationBar: GlobalBottomNavbar(),
    );
  }
}

// indexed stack ve ya go router shell route 


