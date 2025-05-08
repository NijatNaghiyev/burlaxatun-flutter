import 'package:burla_xatun/cubits/medicine/medicine_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../utils/extensions/num_extensions.dart';
import 'single_medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.84,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<MedicineCubit, MedicineState>(
        builder: (_, state) {
          if (state.status == MedicineStatus.loading) {
            return Center(
              child: CustomCircularProgressIndicator(),
            );
          }
          if (state.status == MedicineStatus.failure) {
            return Center(
              child: Text('Error'),
            );
          }
          if (state.status == MedicineStatus.networkError) {
            return Center(
              child: Text('Network Error'),
            );
          }

          if (state.status == MedicineStatus.success) {
            final results = state.response?.results ?? [];
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, i) {
                return Center(
                  child: Column(
                    children: [
                      SingleMedicineTile(
                        data: results[i],
                      ),
                      10.h,
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
