import '../contractor/faqs_contractor.dart';
import '../models/remote/response/faqs_model.dart';
import '../services/remote/faqs_service.dart';

class FaqsRepository implements FaqsContractor {
  FaqsRepository(this._faqsService);

  final FaqsService _faqsService;

  @override
  Future<FaqsResponse> getFaqs() {
    return _faqsService.getFaqs();
  }
}
