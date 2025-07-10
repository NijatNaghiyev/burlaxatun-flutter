import '../models/remote/response/contact_model.dart';

abstract class ContactContractor {
  Future<ContactResponse> getContact();
}
