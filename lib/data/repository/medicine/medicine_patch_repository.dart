import 'package:burla_xatun/data/contractor/medicine/medicine_patch_contractor.dart';
import 'package:burla_xatun/data/services/remote/medicine/medicine_patch_service.dart';

class MedicinePatchRepository implements MedicinePatchContractor {
  MedicinePatchRepository(this._medicinePatchService);

  final MedicinePatchService _medicinePatchService;

  @override
  Future<bool> patchMedicine({
    required String slug,
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) {
    return _medicinePatchService.patchMedicine(
      slug: slug,
      name: name,
      dose: dose,
      frequency: frequency,
      startDate: startDate,
      endDate: endDate,
      status: status,
    );
  }
}
