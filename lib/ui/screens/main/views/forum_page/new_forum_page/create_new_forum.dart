import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:flutter/material.dart';

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
