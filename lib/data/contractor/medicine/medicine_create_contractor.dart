abstract class MedicineCreateContractor {
  Future<bool> createMedicine({
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  });
}
