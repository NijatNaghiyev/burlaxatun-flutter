import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalText extends StatelessWidget {
  const GlobalText({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.fontStyle = FontStyle.normal,
    this.decoration = TextDecoration.none,
    this.overflow,
  });

  final double? fontSize;
  final double? height;
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      text,
      style: GoogleFonts.poppins(
        decorationThickness: 2,
        decoration: decoration,
        fontStyle: fontStyle,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
