import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton(
      {super.key,
      this.buttonColor,
      this.borderColor = Colors.transparent,
      this.textColor,
      this.onPressed,
      this.height = 55,
      this.child});

  final double height;
  final Color? buttonColor;
  final Color borderColor;
  final Color? textColor;
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          // padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
          // fixedSize: WidgetStatePropertyAll(Size(double.maxFinite, double.maxFinite)),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStatePropertyAll(
            BorderSide(
              width: 1,
              color: borderColor,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
