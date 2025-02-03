import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../cubits/questions_cubit/questions_cubit.dart';

class UltrasoundWeeksBottomsheet extends StatelessWidget {
  const UltrasoundWeeksBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: CupertinoPicker(
          itemExtent: 40,
          onSelectedItemChanged: (v) {
            questionCubit.updateUltrasoundWeekCount(v);
          },
          children: [
            for (int i = 0; i < 10; i++)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$i'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
