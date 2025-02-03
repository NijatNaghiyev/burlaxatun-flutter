import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';

class UltrasoundDaysBottomsheet extends StatelessWidget {
  const UltrasoundDaysBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Text('gun sayi'),
          30.h,
          SizedBox(
            height: 230,
            child: CupertinoPicker(
              itemExtent: 40,
              onSelectedItemChanged: (v) {
                questionCubit.updateUltrasoundDaysCount(v);
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
        ],
      ),
    );
  }
}
