import 'package:flutter/material.dart';

import '../../../../../../../widgets/global_input.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchInput({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GlobalInput(
      prefixIcon: 'assets/icons/search_icon.svg',
      hintText: 'Axtarış...',
      onChanged: onChanged,
    );
  }
}
