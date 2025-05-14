abstract class MedicinePatchContractor {
  Future<bool> patchMedicine({
    required String slug,
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  });
}
