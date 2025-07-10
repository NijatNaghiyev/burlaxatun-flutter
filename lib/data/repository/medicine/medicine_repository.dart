import '../../contractor/medicine/medicine_contractor.dart';
import '../../models/remote/response/medicine/medicines_model.dart';
import '../../services/remote/medicine/medicine_service.dart';

class MedicineRepository implements MedicineContractor {
  MedicineRepository(this._medicineService);

  final MedicineService _medicineService;

  @override
  Future<MedicineResponse> getMedicines() {
    return _medicineService.getMedicines();
  }
}
