import '../contractor/doctors_detail_contractor.dart';
import '../models/remote/response/doctor_detail_model.dart';
import '../services/remote/doctors_detail_service.dart';

class DoctorDetailRepository implements DoctorDetailContractor {
  DoctorDetailRepository(this._doctorDetailService);

  final DoctorDetailService _doctorDetailService;

  @override
  Future<DoctorDetailResponse> getDoctorDetail({required String slug}) {
    return _doctorDetailService.getDoctorDetail(slug: slug);
  }
}
