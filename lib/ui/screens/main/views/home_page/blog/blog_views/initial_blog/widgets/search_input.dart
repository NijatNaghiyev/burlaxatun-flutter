import 'package:burla_xatun/ui/widgets/global_input.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalInput(
      prefixIcon: 'assets/icons/search_icon.svg',
      hintText: 'Axtarış...',
    );
  }
}
