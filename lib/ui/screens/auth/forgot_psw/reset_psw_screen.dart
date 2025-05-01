import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/ui/widgets/global_input.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPswScreen extends StatefulWidget {
  const ResetPswScreen({super.key});

  @override
  State<ResetPswScreen> createState() => _ResetPswScreenState();
}

class _ResetPswScreenState extends State<ResetPswScreen> {
  final ValueNotifier<bool> _newPasswordVisibility = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordVisibility =
      ValueNotifier<bool>(false);

  @override
  void dispose() {
    _newPasswordVisibility.dispose();
    _confirmPasswordVisibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardVisible = keyboardHeight > 0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: GlobalAppbar(
          title: "",
          leading: SizedBox.shrink(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: PaddingConstants.h20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.h,
                        GlobalText(
                          text: TextConstants.resetPsw,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        12.h,
                        GlobalText(
                          text: TextConstants.typeSomething,
                        ),
                        24.h,
                        GlobalText(
                          text: TextConstants.newPsw,
                          color: ColorConstants.textFieldTitleColor,
                          fontWeight: FontWeight.w500,
                        ),
                        20.h,
                        ValueListenableBuilder(
                          valueListenable: _newPasswordVisibility,
                          builder: (_, isVisibile, __) => GlobalInput(
                            isObsecure: !isVisibile,
                            hintText: TextConstants.enterYourEmail,
                            prefixIcon: AssetConstants.lockIcon,
                            suffixIcon: isVisibile
                                ? AssetConstants.eyeOpenedIcon
                                : AssetConstants.eyeClosedIcon,
                            onSuffixIconTap: () {
                              setState(() {
                                _newPasswordVisibility.value = !isVisibile;
                              });
                            },
                          ),
                        ),
                        20.h,
                        GlobalText(
                          text: TextConstants.confirmNewPsw,
                          color: ColorConstants.textFieldTitleColor,
                          fontWeight: FontWeight.w500,
                        ),
                        20.h,
                        ValueListenableBuilder(
                          valueListenable: _confirmPasswordVisibility,
                          builder: (_, isVisible, __) => GlobalInput(
                            isObsecure: !isVisible,
                            hintText: TextConstants.enterYourEmail,
                            prefixIcon: AssetConstants.lockIcon,
                            suffixIcon: isVisible
                                ? AssetConstants.eyeOpenedIcon
                                : AssetConstants.eyeClosedIcon,
                            onSuffixIconTap: () {
                              setState(() {
                                _confirmPasswordVisibility.value = !isVisible;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: isKeyboardVisible ? 20 : 32,
                ),
                child: GlobalButton(
                  buttonName: TextConstants.resetPsw,
                  buttonColor: ColorConstants.primaryRedColor,
                  textColor: ColorConstants.white,
                  onPressed: () {
                    context.go(
                      '/forgot_psw_success',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
