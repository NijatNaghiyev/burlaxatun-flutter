import '../contractor/contact_contractor.dart';
import '../models/remote/response/contact_model.dart';
import '../services/remote/contact_service.dart';

class ContactRepository implements ContactContractor {
  ContactRepository(this._contactService);

  final ContactService _contactService;

  @override
  Future<ContactResponse> getContact() {
    return _contactService.getContact();
  }
}
