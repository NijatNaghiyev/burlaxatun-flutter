import 'package:burla_xatun/cubits/baby_names2/baby_names2_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoyNames extends StatelessWidget {
  const BoyNames({
    super.key,
    required this.countryId,
  });

  final String countryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyNamesCubit2, BabyNamesState2>(
      // buildWhen: (previous, current) => previous.names != current.names,
      builder: (_, state) {
        if (state.status == BabyNamesStatus2.loading) {
          return Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if (state.status == BabyNamesStatus2.failure) {
          return Center(
            child: Text('Error'),
          );
        }

        if (state.status == BabyNamesStatus2.networkError) {
          return Center(
            child: Text('Network error'),
          );
        }

        if (state.status == BabyNamesStatus2.success) {
          final boyNames = state.response?.results
                  ?.where((result) => result.gender == 'male')
                  .toList() ??
              [];
          return Expanded(
            child: ListView.separated(
              itemCount: boyNames.length,
              itemBuilder: (_, i) {
                final boyName = boyNames[i];
                //return BoyNameTile(boyName: boyName, countryId: countryId);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xffDADADA),
                );
              },
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
