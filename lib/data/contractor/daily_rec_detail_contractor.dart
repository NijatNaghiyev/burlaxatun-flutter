import '../models/remote/response/daily_rec_detail_model.dart';

abstract class DailyRecDetailContractor {
  Future<DailyRecDetailResponse> getDailyRecDetail({required String slug});
}
