import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/medicine/medicine_contractor.dart';
import '../../data/models/remote/response/medicine/medicines_model.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit(this._medicineContractor) : super(MedicineState.initial());

  final MedicineContractor _medicineContractor;

  Future<void> getMedicines() async {
    try {
      emit(state.copyWith(status: MedicineStatus.loading));

      final response = await _medicineContractor.getMedicines();

      emit(state.copyWith(
        status: MedicineStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: MedicineStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MedicineStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
