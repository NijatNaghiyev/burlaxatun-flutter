import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/color_constants.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Dont have an account?',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xff070707),
              fontWeight: FontWeight.w400,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: ' Sign Up',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.w400,
              height: 1.1,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.push('/sign_up'),
          ),
        ],
      ),
    );
  }
}
