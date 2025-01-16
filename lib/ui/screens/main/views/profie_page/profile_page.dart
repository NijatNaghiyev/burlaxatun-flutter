import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/main/main_state.dart';
import '../../../../../cubits/main/mainn_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return BlocBuilder<MainnCubit, MainInitial>(
      buildWhen: (previous, current) {
        return previous.profileViewName != current.profileViewName;
      },
      builder: (context, state) {
        return mainCubit.profileViews[state.profileViewName]!;
      },
    );
  }
}
