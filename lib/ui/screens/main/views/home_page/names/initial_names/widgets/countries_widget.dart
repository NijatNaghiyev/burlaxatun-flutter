import 'package:burla_xatun/cubits/baby_names2/baby_names2_cubit.dart';
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
    final babyNamesCubit = context.read<BabyNamesCubit2>();
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

          return Expanded(
            child: ListView.separated(
              itemCount: data.length,
              itemBuilder: (_, i) {
                final country = data[i];

                return ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      country.flag ?? '',
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/png/flag.png',
                        width: 46,
                        height: 46,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(country.name ?? 'Naməlum'),
                  trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
                  onTap: () {
                    context.push('/gender_names', extra: {
                      'id': "${country.id}",
                      'cubit': babyNamesCubit,
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
