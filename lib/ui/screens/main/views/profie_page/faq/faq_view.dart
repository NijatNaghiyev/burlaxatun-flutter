import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/profie_page/faq/widgets/question_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/global_appbar.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      appBar: GlobalAppbar(
        title: 'Tez-tez verilən suallar',
        onTap: () {
          mainCubit.goBackInitialProfileView();
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
