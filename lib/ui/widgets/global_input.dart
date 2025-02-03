import '../../utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/color_constants.dart';
import '../../utils/extensions/num_extensions.dart';
import 'global_text.dart';

class GlobalInput extends StatelessWidget {
  const GlobalInput({
    super.key,
    this.inputName,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.isObsecure = false,
    this.onSuffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.textController,
  });

  final String? inputName;
  final String hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final bool isObsecure;
  final void Function()? onSuffixIcon;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final void Function(String v)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputName != null
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: inputName!,
                        fontSize: 14,
                        height: 1.1,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  context.deviceHeight < 750 ? 8.h : 16.h,
                ],
              )
            : SizedBox.shrink(),
        TextFormField(
          controller: textController,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          obscureText: isObsecure,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: Color(0xff595959),
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    prefixIcon,
                    fit: BoxFit.cover,
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
              borderRadius: BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.enabledInputColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
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
