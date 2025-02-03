import 'package:flutter/material.dart';

import '../../../../../widgets/global_appbar.dart';

class CreateNewForum extends StatelessWidget {
  const CreateNewForum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'New Forum',
        onTap: () {},
      ),
      body: Container(),
    );
  }
}
