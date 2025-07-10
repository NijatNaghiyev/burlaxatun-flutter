import '../contractor/doctors_list_contractor.dart';
import '../models/remote/response/doctors_list_model.dart';
import '../services/remote/doctors_list_service.dart';

class DoctorsListRepository implements DoctorsListContractor {
  DoctorsListRepository(this._doctorsListService);

  final DoctorsListService _doctorsListService;

  @override
  Future<DoctorsListResponse> getDoctorsList() {
    return _doctorsListService.getDoctorsList();
  }
}
