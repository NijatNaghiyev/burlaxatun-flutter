import '../models/remote/response/doctor_detail_model.dart';

abstract class DoctorDetailContractor {
  Future<DoctorDetailResponse> getDoctorDetail({required String slug});
}
