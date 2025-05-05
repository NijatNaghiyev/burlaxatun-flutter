// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
//
// class CountriesWidget extends StatelessWidget {
//   const CountriesWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final babyNamesCubit = context.read<BabyNamesCubit>();
//     return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
//       buildWhen: (previous, current) {
//         return previous.countryList != current.countryList;
//       },
//       builder: (context, state) {
//
//         if (state.nameStateStatus == NameStateStatus.error) {
//           log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
//           return Center(
//             child: Text('Melumat tapilmadi'),
//           );
//         } else if (state.nameStateStatus == NameStateStatus.success) {
//           log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
//           return Expanded(
//             child: ListView.separated(
//               itemCount: state.countryList!.length,
//               itemBuilder: (_, i) {
//                 return ListTile(
//                   leading: Image.asset(
//                     'assets/png/flag.png',
//                     width: 46,
//                     height: 46,
//                   ),
//                   title: Text(state.countryList![i].title),
//                   trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
//                   onTap: () {
//                     context.push('/gender_names', extra: {
//                       'id': state.countryList![i].id,
//                       'cubit': babyNamesCubit,
//                     });
//                   },
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return Divider(
//                   color: Color(0xffDADADA),
//                 );
//               },
//             ),
//           );
//         } else if (state.nameStateStatus == NameStateStatus.loading) {
//           log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
//           return Center(child: CircularProgressIndicator.adaptive());
//         }
//         log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
//         return SizedBox.shrink();
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../cubits/countries/countries_cubit.dart';
import '../../../../../../../widgets/custom_circular_progress_indicator.dart';

class CountriesWidget extends StatelessWidget {
  const CountriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (_, state) {
        if (state.status == CountriesStatus.loading) {
          return const Center(
            child: CustomCircularProgressIndicator(isWhite: false),
          );
        }

        if (state.status == CountriesStatus.failure) {
          return const Center(
            child: Text('Error'),
          );
        }

        if (state.status == CountriesStatus.networkError) {
          return const Center(
            child: Text('Network error'),
          );
        }

        if (state.status == CountriesStatus.success) {
          final data = state.response?.results ?? [];
          final result = data.isNotEmpty ? data[0] : null;

          return Expanded(
            child: ListView.separated(
              itemCount: data.length,
              itemBuilder: (_, i) {
                final country = data[i];

                return ListTile(
                  leading: Image.network(
                    country.flag ?? '',
                    width: 46,
                    height: 46,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/png/flag.png',
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(country.name ?? 'Naməlum'),
                  trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
                  onTap: () {
                    context.push('/gender_names', extra: {
                      'id': country.id,
                      //'cubit': babyNamesCubit,
                    });
                  },
                );
              },
              separatorBuilder: (_, __) =>
                  const Divider(color: Color(0xffDADADA)),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
