import 'package:burla_xatun/data/contractor/medicine_create_contractor.dart';
import 'package:burla_xatun/data/services/remote/medicine_create_service.dart';

class MedicineCreateRepository implements MedicineCreateContractor {
  MedicineCreateRepository(this._medicineCreateService);

  final MedicineCreateService _medicineCreateService;

  @override
  Future<bool> createMedicine({
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) {
    return _medicineCreateService.createMedicine(
      name: name,
      dose: dose,
      frequency: frequency,
      startDate: startDate,
      endDate: endDate,
      status: status,
    );
  }
}
