import 'package:flutter/material.dart';

class GlobalAppbar extends StatelessWidget {

  const GlobalAppbar({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}