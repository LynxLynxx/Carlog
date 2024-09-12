import 'package:carlog/web_features/web_contact/domain/entities/contact_entity.dart';

abstract class ContactDatasource {
  Future<void> sendEmail(ContactEntity contact);
}

class ContactDatasourceImpl implements ContactDatasource {
  ContactDatasourceImpl();

  @override
  Future<void> sendEmail(
    ContactEntity contact,
  ) async {
    // try {
    //   await FirebaseFirestore.instance.collection(COLLECTION_CONTACT).add(contact.toJson());
    // } catch (e) {
    //   handleException(e);
    // }
  }
}
