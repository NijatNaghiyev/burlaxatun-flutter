import '../models/remote/response/medicines_model.dart';

abstract class MedicineContractor {
  Future<MedicineResponse> getMedicines();
}
