import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import 'girl_name_tile.dart';

class GirlNames extends StatefulWidget {
  const GirlNames({
    super.key,
    required this.countryId,
  });

  final String countryId;

  @override
  State<GirlNames> createState() => _GirlNamesState();
}

class _GirlNamesState extends State<GirlNames>
    with AutomaticKeepAliveClientMixin {
  late BabyNamesCubit babyNamesCubit;

  @override
  void initState() {
    babyNamesCubit = context.read<BabyNamesCubit>();
    babyNamesCubit.getNames(countryId: widget.countryId, gender: 'female');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyNamesCubit, BabyNamesState>(
      buildWhen: (previous, current) {
        return previous.femaleNamesList != current.femaleNamesList;
      },
      builder: (context, state) {
        if (state.nameStateStatus == NameStateStatus.loading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state.nameStateStatus == NameStateStatus.error) {
          return Center(child: Text('data not found'));
        } else if (state.nameStateStatus == NameStateStatus.networkError) {
          return Center(child: Text('connection error'));
        }
        if (state.nameStateStatus == NameStateStatus.success) {
          final girlNames = state.femaleNamesList;
          return ListView.separated(
            itemCount: girlNames?.length ?? 0,
            itemBuilder: (_, i) {
              final name = girlNames?[i].name ?? 'name not found';
              return GirlNameTile(name: name);
            },
            separatorBuilder: (_, index) {
              return Divider(
                color: Color(0xffDADADA),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
