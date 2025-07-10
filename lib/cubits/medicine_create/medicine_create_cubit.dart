import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/medicine/medicine_create_contractor.dart';

part 'medicine_create_state.dart';

class MedicineCreateCubit extends Cubit<MedicineCreateState> {
  MedicineCreateCubit(this._medicineCreateContractor)
      : super(const MedicineCreateState(status: MedicineCreateStatus.initial));

  final MedicineCreateContractor _medicineCreateContractor;

  Future<void> createMedicine({
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) async {
    try {
      emit(state.copyWith(status: MedicineCreateStatus.loading));
      log("Medicine create loading");

      final response = await _medicineCreateContractor.createMedicine(
        name: name,
        dose: dose,
        frequency: frequency,
        startDate: startDate,
        endDate: endDate,
        status: status,
      );

      if (response) {
        emit(state.copyWith(status: MedicineCreateStatus.success));
        log('Medicine create success');
        return;
      }
    } on DioException catch (e, s) {
      emit(state.copyWith(status: MedicineCreateStatus.networkError));
      log("Medicine create DioException: $e", stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(status: MedicineCreateStatus.failure));
      log("Medicine create unknown error: $e", stackTrace: s);
    }
  }
}
