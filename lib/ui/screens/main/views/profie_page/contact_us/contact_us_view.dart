import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/main/mainn_cubit.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Bizimle elaqe saxla',
        onTap: () {
          mainCubit.goBackInitialProfileView();
        },
      ),
      body: Container(),
    );
  }
}
