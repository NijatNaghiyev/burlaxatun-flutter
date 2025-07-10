import '../models/remote/response/about_model.dart';

abstract class AboutContractor {
  Future<AboutResponse> getAbout();
}
