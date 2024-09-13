import 'package:carlog/web_features/web_contact/domain/entities/contact_entity.dart';
import 'package:emailjs/emailjs.dart' as emailjs;

abstract class ContactDatasource {
  Future<void> sendEmail(ContactEntity contact);
}

class ContactDatasourceImpl implements ContactDatasource {
  ContactDatasourceImpl();

  @override
  Future<void> sendEmail(
    ContactEntity contact,
  ) async {
    Map<String, dynamic> templateParams = {
      'from_email': contact.email,
      'from_name': contact.sender,
      'subject': contact.subject,
      'message': contact.message,
    };

    try {
      
      print('SUCCESS!');
    } catch (error) {
      print('$error');
    }
    // try {
    //   await FirebaseFirestore.instance.collection(COLLECTION_CONTACT).add(contact.toJson());
    // } catch (e) {
    //   handleException(e);
    // }
  }
}
