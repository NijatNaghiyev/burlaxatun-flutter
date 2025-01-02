import 'package:burla_xatun/ui/widgets/global_bottom_navbar/global_bottom_navbar.dart';
import 'package:flutter/material.dart';

class UltrasoundPage extends StatelessWidget {
  const UltrasoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ULTRASOUND PAGE'),
      ),
      body: Center(
        child: Text('ULTRASOUND'),
      ),
      bottomNavigationBar: GlobalBottomNavbar(),
    );
  }
}
