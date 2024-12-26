import '../../../../../utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../widgets/global_text.dart';

class AcceptPolicyCheckBox extends StatelessWidget {
  const AcceptPolicyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Row(
      children: [
        BlocBuilder<SignupCubit, SignupCubitState>(
          builder: (context, state) {
            if (state is SignupCubitInitial) {
              return Checkbox(
                splashRadius: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: ColorConstants.primaryColor,
                value: state.isChecked,
                onChanged: (v) {
                  signupCubit.checkBoxToggle(v!);
                },
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        GlobalText(
          text: 'İstifadı qaydalalrı və məxfilik siyasəti ilə razıyam',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff8D8D8D),
        )
      ],
    );
  }
}
