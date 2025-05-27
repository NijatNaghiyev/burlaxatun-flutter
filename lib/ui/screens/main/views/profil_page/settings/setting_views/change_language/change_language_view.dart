import 'package:burla_xatun/cubits/language_cubit/language_cubit.dart';
import 'package:burla_xatun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();
    final language = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change language'),
      ),
      body: Center(
        child: Column(
          children: [
            50.h,
            Text(language.select),
            30.h,
            ElevatedButton(
              onPressed: () {
                languageCubit.changeLanguage('az');
              },
              child: Text('Azerbaycan dili'),
            ),
            30.h,
            ElevatedButton(
              onPressed: () {
                languageCubit.changeLanguage('en');
              },
              child: Text('Ingilis dili'),
            ),
            50.h,
            Text(language.language),
          ],
        ),
      ),
    );
  }
}
