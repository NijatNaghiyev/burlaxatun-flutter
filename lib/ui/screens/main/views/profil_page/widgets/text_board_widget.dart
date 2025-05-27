import 'package:flutter/material.dart';

class TextBoardWidget extends StatelessWidget {
  const TextBoardWidget({
    super.key,
    required this.text,
  });

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: text,
      ),
    );
  }
}
