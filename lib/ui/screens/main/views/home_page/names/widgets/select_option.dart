import 'package:flutter/material.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    super.key,
    required this.optionOne,
    required this.optionTwo,
  });

  final Widget optionOne;
  final Widget optionTwo;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffE4E7EC),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            optionOne,
            SizedBox(width: 5),
            optionTwo,
          ],
        ),
      ),
    );
  }
}
