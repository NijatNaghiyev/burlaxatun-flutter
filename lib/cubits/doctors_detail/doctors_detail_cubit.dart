import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/doctors_detail_contractor.dart';
import '../../data/models/remote/response/doctor_detail_model.dart';

part 'doctors_detail_state.dart';

class DoctorDetailCubit extends Cubit<DoctorDetailState> {
  DoctorDetailCubit(this._doctorDetailContractor)
      : super(DoctorDetailState.initial());

  final DoctorDetailContractor _doctorDetailContractor;

  Future<void> getDoctorDetail(String slug) async {
    try {
      emit(state.copyWith(status: DoctorDetailStatus.loading));

      final response =
          await _doctorDetailContractor.getDoctorDetail(slug: slug);

      emit(state.copyWith(
        status: DoctorDetailStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: DoctorDetailStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DoctorDetailStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
