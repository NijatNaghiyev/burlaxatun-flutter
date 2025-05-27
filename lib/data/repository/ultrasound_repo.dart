import 'package:burla_xatun/data/contractor/ultrasound_contract.dart';
import 'package:burla_xatun/data/services/remote/ultrasound_service.dart';
import 'package:dio/src/response.dart';

class UltrasoundRepo implements UltrasoundContract {
  UltrasoundRepo(this.ultrasoundService);

  final UltrasoundService ultrasoundService;

  @override
  Future<Response<dynamic>> getUltraSound() {
    return ultrasoundService.getUltraSound();
  }
}
