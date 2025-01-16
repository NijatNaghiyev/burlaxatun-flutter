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
    return SizedBox(
      // width: context.deviceWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE4E7EC),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              optionOne,
              SizedBox(width: 18),
              ColoredBox(
                color: Color(0xffD0D5DD),
                child: SizedBox(
                  width: 1,
                  height: 18,
                ),
              ),
              SizedBox(width: 18),
              optionTwo,
            ],
          ),
        ),
      ),
    );
  }
}
