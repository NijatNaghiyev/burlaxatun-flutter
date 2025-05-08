import '../contractor/about_contractor.dart';
import '../models/remote/response/about_model.dart';
import '../services/remote/about_service.dart';

class AboutRepository implements AboutContractor {
  AboutRepository(this._aboutService);

  final AboutService _aboutService;

  @override
  Future<AboutResponse> getAbout() {
    return _aboutService.getAbout();
  }
}
