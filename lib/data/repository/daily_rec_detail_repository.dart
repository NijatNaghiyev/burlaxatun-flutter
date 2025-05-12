import 'package:burla_xatun/data/services/remote/daily_rec_detail_service.dart';

import '../contractor/daily_rec_detail_contractor.dart';
import '../models/remote/response/daily_rec_detail_model.dart';

class DailyRecDetailRepository implements DailyRecDetailContractor {
  DailyRecDetailRepository(this._dailyRecDetailService);

  final DailyRecDetailService _dailyRecDetailService;

  @override
  Future<DailyRecDetailResponse> getDailyRecDetail({required String slug}) {
    return _dailyRecDetailService.getDailyRecDetail(slug: slug);
  }
}
