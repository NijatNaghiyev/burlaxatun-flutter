import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Mexvilik siyaseti',
        onTap: () {
          mainCubit.goBackInitialProfileView();
        },
      ),
      body: Container(),
    );
  }
}
