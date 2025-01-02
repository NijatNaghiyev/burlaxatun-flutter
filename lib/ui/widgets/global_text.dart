import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalText extends StatelessWidget {
  const GlobalText({
    super.key,
    required this.text,
    required this.fontSize,
    this.height = 1.1,
    required this.fontWeight,
    required this.color,
    this.textAlign = TextAlign.center,
    this.maxLines = 20,
  });

  final double fontSize;
  final double height;
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}


// Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   prefixIcon,
//                   fit: BoxFit.cover,
//                 ),
//               ],
//             ),