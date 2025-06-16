import 'package:flutter/material.dart';

import '../../widgets/select_option.dart';
import '../../widgets/single_option.dart';

class SelectGenderBox extends StatelessWidget {
  const SelectGenderBox({
    super.key,
    required this.genderScreenIndex,
    required this.pageController,
  });

  final ValueNotifier<int> genderScreenIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: genderScreenIndex,
      builder: (context, value, child) {
        return SelectOption(
          optionOne: SingleOption(
            boxTitle: 'Oğlan',
            boxColors: value == 0 ? Colors.white : Colors.transparent,
            onTap: () {
              genderScreenIndex.value = 0;
              pageController.jumpToPage(genderScreenIndex.value);
            },
          ),
          optionTwo: SingleOption(
            boxTitle: 'Qız',
            boxColors: value == 1 ? Colors.white : Colors.transparent,
            onTap: () {
              genderScreenIndex.value = 1;
              pageController.jumpToPage(genderScreenIndex.value);
            },
          ),
        );
      },
    );
  }
}
