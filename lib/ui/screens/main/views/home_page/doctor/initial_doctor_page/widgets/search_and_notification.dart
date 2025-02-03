import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../widgets/global_input.dart';

class SearchAndNotification extends StatelessWidget {
  const SearchAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              child: GlobalInput(
                prefixIcon: 'assets/icons/search_icon.svg',
                hintText: 'Axtarış...',
              ),
            ),
            GestureDetector(
              onTap: () {
                mainCubit.showDoctorsNotification(context);
              },
              child: SvgPicture.asset('assets/icons/notification_bing.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
