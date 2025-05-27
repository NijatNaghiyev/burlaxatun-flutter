import 'dart:developer';
import 'dart:io';

import 'package:burla_xatun/data/contractor/indicator_contract.dart';
import 'package:burla_xatun/data/models/remote/response/indicator_model.dart';
import 'package:burla_xatun/data/repository/indicator_repo.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'indicator_state.dart';

enum IndicatorStatus { initial, loading, success, error, networkError }

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit(this.indicatorContract) : super(IndicatorState());

  final IndicatorContract indicatorContract;

  Future<void> getIndicatorDatas({
    required String indicatorName,
    required String range,
  }) async {
    try {
      emit(state.copyWith(indicatorStatus: IndicatorStatus.loading));
      final response = await indicatorContract.getIndicator(
        babyId: 96,
        indicatorName: indicatorName,
        range: range,
      );
      if (response.statusCode.isSuccess) {
        final indicatorData = response.data as List;
        final indicatorList =
            indicatorData.map((e) => IndicatorModel.fromJson(e)).toList();
        emit(state.copyWith(
          indicatorStatus: IndicatorStatus.success,
          indicatorList: indicatorList.reversed.toList(),
        ));
      }
    } on DioException catch (e, s) {
      if (e.type is SocketException) {
        log('network error');
        emit(state.copyWith(indicatorStatus: IndicatorStatus.networkError));
      }
      log('Error occured while gettinng indicator data: $e', stackTrace: s);
      emit(state.copyWith(indicatorStatus: IndicatorStatus.error));
    } catch (e, s) {
      log('Error occured while gettinng indicator data: $e', stackTrace: s);
      emit(state.copyWith(indicatorStatus: IndicatorStatus.error));
    }
  }
}
