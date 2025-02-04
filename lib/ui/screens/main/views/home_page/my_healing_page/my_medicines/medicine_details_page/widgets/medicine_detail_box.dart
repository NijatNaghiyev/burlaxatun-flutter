import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../cubits/main/mainn_cubit.dart';
import 'medicine_detail_tile.dart';

class MedicineDetailBox extends StatelessWidget {
  const MedicineDetailBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SizedBox(
      height: 414,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 36.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 6; i++)
                MedicineDetailTile(
                  detailName: mainCubit.medicineDetailItems[i].detailName,
                  detail: 'detail',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
