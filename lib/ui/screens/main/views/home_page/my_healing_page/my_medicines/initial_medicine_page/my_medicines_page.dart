import 'dart:developer';

import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../widgets/global_appbar.dart';
import '../../widgets/add_button.dart';
import 'widgets/medicine_list.dart';

class MyMedicinesPage extends StatelessWidget {
  const MyMedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Dərmanlarım',
        onTap: () => context.pop(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  MedicineList(),
                  Positioned(
                    bottom: 68,
                    right: 5,
                    child: AddButton(
                      onPressed: () {
                        log('message');
                        mainCubit.showAddMedicine(context);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
