import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../widgets/global_text.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.inputName,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.isObsecure = false,
    this.onSuffixIcon,
  });

  final String inputName;
  final String hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final bool isObsecure;
  final void Function()? onSuffixIcon;
  // final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final loginCubit = context.read<LoginCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlobalText(
              text: inputName,
              fontSize: 14,
              height: 1.1,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
        16.h,
        TextFormField(
          obscureText: isObsecure,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: ColorConstants.hintTextColor,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 15, bottom: 21, top: 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: SvgPicture.asset(
                      prefixIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            suffixIcon: suffixIcon == null
                ? SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(right: 29),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: GestureDetector(
                        onTap: onSuffixIcon,
                        child: SvgPicture.asset(suffixIcon!),
                      ),
                    ),
                  ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: ColorConstants.enabledInputColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: ColorConstants.enabledInputColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
