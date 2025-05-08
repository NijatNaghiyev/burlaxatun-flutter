import 'package:burla_xatun/data/models/remote/response/pregnancy_calculate_model.dart';

abstract class PregnancyCalculateContractor {
  Future<PregnancyCalculateModel> calculatePregnancy({
    required int type,
    required String date,
    int? period,
    int? ivf,
    int? week,
    int? day,
  });
}
