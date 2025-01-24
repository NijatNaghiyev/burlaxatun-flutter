import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';
import 'widgets/question_box.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      appBar: GlobalAppbar(
        title: 'Tez-tez verilən suallar',
        onTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    QuestionBox(index: i),
                    SizedBox(height: 20),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
