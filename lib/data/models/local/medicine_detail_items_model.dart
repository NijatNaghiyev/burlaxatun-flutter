class MedicineDetailItemsModel {
  MedicineDetailItemsModel({required this.detailName});

  final String detailName;

  static List<MedicineDetailItemsModel> items = [
    MedicineDetailItemsModel(detailName: 'Ad'),
    MedicineDetailItemsModel(detailName: 'Doza'),
    MedicineDetailItemsModel(detailName: 'Dərman qəbulun tezliyi'),
    MedicineDetailItemsModel(detailName: 'Başlama tarixi'),
    MedicineDetailItemsModel(detailName: 'Bitmə tarixi'),
    MedicineDetailItemsModel(detailName: 'Status'),
  ];
}
