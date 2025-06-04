import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_text.dart';

class AcceptPolicyCheckBox extends StatelessWidget {
  const AcceptPolicyCheckBox({
    super.key,
    required this.isCheckedPolicy,
  });
  final ValueNotifier<bool> isCheckedPolicy;

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isCheckedPolicy,
          builder: (context, value, child) {
            return Checkbox(
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              side: BorderSide(
                width: 2,
                color: Colors.grey,
              ),
              splashRadius: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: ColorConstants.primaryRedColor,
              value: value,
              onChanged: (v) {
                isCheckedPolicy.value = v!;
                signupCubit.checkBoxToggle(isCheckedPolicy.value);
                signupCubit.updateIsValid();
              },
            );
          },
        ),
        // BlocBuilder<SignupCubit, SignupState>(
        //   buildWhen: (previous, current) {
        //     return true;
        //   },
        //   builder: (context, state) {
        //     if (state is SignupInitial) {
        //       return
        //     } else {
        //       return SizedBox.shrink();
        //     }
        //   },
        // ),
        SizedBox(width: 9),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: GlobalText(
            height: 1.2,
            textAlign: TextAlign.left,
            text: 'İstifadə qaydalalrı və məxfilik siyasəti ilə razıyam',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff8D8D8D),
          ),
        )
      ],
    );
  }
}
