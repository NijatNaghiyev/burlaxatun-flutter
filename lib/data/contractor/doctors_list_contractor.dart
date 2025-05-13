import '../models/remote/response/doctors_list_model.dart';

abstract class DoctorsListContractor {
  Future<DoctorsListResponse> getDoctorsList();
}
