import '../../models/remote/response/medicine/medicines_model.dart';

abstract class MedicineContractor {
  Future<MedicineResponse> getMedicines();
}
