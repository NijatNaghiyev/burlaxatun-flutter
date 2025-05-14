import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/medicine/medicine_patch_contractor.dart';

part 'medicine_patch_state.dart';

class MedicinePatchCubit extends Cubit<MedicinePatchState> {
  MedicinePatchCubit(this._medicinePatchContractor)
      : super(const MedicinePatchState(status: MedicinePatchStatus.initial));

  final MedicinePatchContractor _medicinePatchContractor;

  Future<void> patchMedicine({
    required String slug,
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) async {
    try {
      emit(state.copyWith(status: MedicinePatchStatus.loading));
      log("Medicine patch loading");

      final response = await _medicinePatchContractor.patchMedicine(
        slug: slug,
        name: name,
        dose: dose,
        frequency: frequency,
        startDate: startDate,
        endDate: endDate,
        status: status,
      );

      if (response) {
        emit(state.copyWith(status: MedicinePatchStatus.success));
        log('Medicine patch success');
        return;
      }
    } on DioException catch (e, s) {
      emit(state.copyWith(status: MedicinePatchStatus.networkError));
      log("Medicine patch DioException: $e", stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(status: MedicinePatchStatus.failure));
      log("Medicine patch unknown error: $e", stackTrace: s);
    }
  }
}
