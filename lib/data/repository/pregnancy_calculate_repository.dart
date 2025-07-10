import 'package:burla_xatun/data/contractor/pregnancy_calculate_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/pregnancy_calculate_model.dart';
import 'package:burla_xatun/data/services/remote/pregnancy_service.dart';

class PregnancyCalculateRepository implements PregnancyCalculateContractor {
  PregnancyCalculateRepository(this._pregnancyService);

  final PregnancyService _pregnancyService;
  
  @override
  Future<PregnancyCalculateModel> calculatePregnancy({
    required int type,
    required String date,
    int? period,
    int? ivf,
    int? week,
    int? day,
  }) {
    return _pregnancyService.calculatePregnancy(
      type: type,
      date: date,
      day: day,
      ivf: ivf,
      period: period,
      week: week,
    );
  }
}
