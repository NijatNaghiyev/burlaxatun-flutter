import 'package:flutter/material.dart';

import '../../../../../../widgets/global_input.dart';

class SecondaryForumSearchInput extends StatelessWidget {
  const SecondaryForumSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalInput(
      prefixIcon: 'assets/icons/search_icon.svg',
      hintText: 'Axtarış...',
    );
  }
}
