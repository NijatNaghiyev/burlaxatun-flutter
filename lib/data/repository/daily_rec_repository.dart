import '../contractor/daily_rec_contractor.dart';
import '../models/remote/response/daily_rec_model.dart';
import '../services/remote/daily_rec_service.dart';

class DailyRecRepository implements DailyRecContractor {
  DailyRecRepository(this._dailyRecService);

  final DailyRecService _dailyRecService;

  @override
  Future<DailyRecResponse> getDailyRec() {
    return _dailyRecService.getDailyRec();
  }
}
