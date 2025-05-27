import 'package:flutter/material.dart';

import '../../../../../../widgets/global_input.dart';

class SecondaryForumSearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SecondaryForumSearchInput({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalInput(
      prefixIcon: 'assets/icons/search_icon.svg',
      hintText: 'Axtarış...',
      onChanged: onChanged,
    );
  }
}
