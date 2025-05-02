import 'package:burla_xatun/data/models/remote/response/daily_rec_model.dart';

abstract class DailyRecContractor {
  Future<DailyRecResponse> getDailyRec();
}
