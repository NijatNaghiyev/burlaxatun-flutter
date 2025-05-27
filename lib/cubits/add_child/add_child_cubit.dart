import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/add_child_contract.dart';
import '../../data/models/remote/request/add_child_request_model.dart';
import '../../utils/extensions/statuscode_extension.dart';

part 'add_child_state.dart';

enum AddChildStatus { initial, loading, success, error, networkError }

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit(this.addChildContract) : super(AddChildState());

  final AddChildContract addChildContract;


  final TextEditingController childFullNameController = TextEditingController();
  final TextEditingController childWeightController = TextEditingController();
  final TextEditingController childHeightController = TextEditingController();
  

  Future<void> addChild({
    required AddChildRequestModel childData,
  }) async {
    try {
      emit(state.copyWith(addChildStatus: AddChildStatus.loading));
      final postData = childData.toJson();
      final response = await addChildContract.addChild(postData: postData);

      if (response.statusCode.isSuccess) {
        emit(state.copyWith(addChildStatus: AddChildStatus.success));
      } else {
        emit(state.copyWith(addChildStatus: AddChildStatus.error));
      }
    } on DioException catch (e, s) {
      if (e.type is SocketException) {
        log('Network error: $e');
        emit(state.copyWith(addChildStatus: AddChildStatus.networkError));
      } else {
        log('Error occured while adding child: $e', stackTrace: s);
        emit(state.copyWith(addChildStatus: AddChildStatus.error));
      }
    } catch (e, s) {
      log('Error occured while adding child: $e', stackTrace: s);
      emit(state.copyWith(addChildStatus: AddChildStatus.error));
    }
  }

  @override
  Future<void> close() {
    childFullNameController.dispose();
    childHeightController.dispose();
    childWeightController.dispose();
    return super.close();
  }
}
