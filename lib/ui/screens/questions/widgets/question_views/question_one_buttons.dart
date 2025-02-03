import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';


class QuestionOneButton extends StatefulWidget {
  const QuestionOneButton({
    super.key,
    required this.buttonName,
    required this.optionIndex,
    required this.questionsCubit,
  });

  final String buttonName;
  final int optionIndex;
  final QuestionsCubit questionsCubit;

  @override
  State<QuestionOneButton> createState() => _QuestionOneButtonState();
}

class _QuestionOneButtonState extends State<QuestionOneButton> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    widget.questionsCubit.questionOneButtonNotifier.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.questionsCubit.questionOneButtonNotifier.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    final selectedIndex = widget.questionsCubit.questionOneButtonNotifier.value;
    if (selectedIndex == widget.optionIndex) {
      if (!isSelected) {
        log(' first ${widget.optionIndex} and $selectedIndex');
        setState(() {
          isSelected = true;
        });
        log('$isSelected');
      }
    } else {
      if (isSelected) {
        log('second ${widget.optionIndex} and $selectedIndex');
        setState(() {
          isSelected = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log('${widget.optionIndex} index builded');

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlobalButton(
        key: ValueKey(widget.optionIndex),
        buttonName: widget.buttonName,
        buttonColor: isSelected ? Color(0xffFFD3E2) : Colors.white,
        borderColor: isSelected ? Colors.transparent : ColorConstants.primaryColor,
        textColor: ColorConstants.primaryColor,
        onPressed: () {
          widget.questionsCubit.questionOneButtonNotifier.value = widget.optionIndex;
          widget.questionsCubit.updateIsActiveButton();
        },
      ),
    );
  }
}

    // Padding(
    //   padding: const EdgeInsets.only(bottom: 14),
    //   child: ValueListenableBuilder(
    //     valueListenable: questionsCubit.questionOneButtonNotifier,
    //     builder: (context, value, child) {
    //       bool isSelected = optionIndex == value;
    //       log('index $value builded');
    //       return GlobalButton(
    //         buttonName: buttonName + '${DateTime.now()}',
    //         buttonColor: isSelected ? Color(0xffFFD3E2) : Colors.white,
    //         borderColor:
    //             isSelected ? Colors.transparent : ColorConstants.primaryColor,
    //         textColor: ColorConstants.primaryColor,
    //         onPressed: () {
    //           questionsCubit.questionOneButtonNotifier.value = optionIndex;
    //           questionsCubit.updateIsActiveButton();
    //         },
    //       );
    //     },
    //   ),
    // );