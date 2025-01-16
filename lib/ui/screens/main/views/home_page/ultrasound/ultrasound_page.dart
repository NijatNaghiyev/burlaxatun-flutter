import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/main/main_state.dart';
import '../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../utils/extensions/num_extensions.dart';
import '../widgets/scrollable_days_appbar.dart';
import 'widgets/format_2d.dart';
import 'widgets/format_3d.dart';
import 'widgets/selectable_ultrasound_format.dart';

class UltrasoundPage extends StatelessWidget {
  const UltrasoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollableDaysAppbar(
        appbarName: 'Ultrasəs',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              children: [
                24.h,
                SelectableUltrasoundFormat(),
                24.h,
                BlocBuilder<MainnCubit, MainInitial>(
                  buildWhen: (previous, current) {
                    return previous.ultrasoundFormat !=
                        current.ultrasoundFormat;
                  },
                  builder: (context, state) {
                    return state.ultrasoundFormat == UltrasoundFormat.format2d
                        ? Format2d()
                        : Format3d();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
