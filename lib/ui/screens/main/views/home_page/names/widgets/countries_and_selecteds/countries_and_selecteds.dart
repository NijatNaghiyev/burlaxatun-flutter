import 'package:burla_xatun/cubits/main/main_state.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/names/widgets/countries_and_selecteds/widgets/countries_and_selecteds_box.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/names/widgets/countries_and_selecteds/widgets/countries_widget.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/names/widgets/countries_and_selecteds/widgets/selected_names_widget.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_appbar.dart';

class CountriesAndSelecteds extends StatelessWidget {
  const CountriesAndSelecteds({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Adlar',
        onTap: () {
          mainCubit.changeHomeView('Home');
          mainCubit.scrollLatestPositionHomePage();
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
