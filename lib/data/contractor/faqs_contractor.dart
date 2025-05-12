import '../models/remote/response/faqs_model.dart';

abstract class FaqsContractor {
  Future<FaqsResponse> getFaqs();
}
