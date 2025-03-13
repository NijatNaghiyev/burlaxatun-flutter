import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';

class SpecialThanksView extends StatefulWidget {
  const SpecialThanksView({super.key});

  @override
  State<SpecialThanksView> createState() => _SpecialThanksViewState();
}

class _SpecialThanksViewState extends State<SpecialThanksView> {
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'xususi teshekkurler',
        onTap: () {
          context.pop();
        },
      ),
      body: Container(),
    );
  }
}
