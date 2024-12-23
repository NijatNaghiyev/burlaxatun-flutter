import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/main/main_state.dart';
import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/constants/padding_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/countries_and_selecteds_box.dart';
import 'widgets/countries_widget.dart';
import 'widgets/selected_names_widget.dart';

class InitialNamesPage extends StatelessWidget {
  const InitialNamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Adlar',
        onTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: PaddingConstants.h20,
        child: Center(
          child: Column(
            children: [
              14.h,
              CountriesAndSelectedsBox(),
              24.h,
              BlocBuilder<MainnCubit, MainInitial>(
                builder: (context, state) {
                  return state.nameViewOptions == NameViewOption.countries
                      ? CountriesWidget()
                      : SelectedNamesWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
