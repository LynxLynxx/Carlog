import 'package:carlog/env/env.dart';
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
    try {
      Map<String, dynamic> templateParams = {
        'from_email': contact.email,
        'from_name': contact.sender,
        'subject': contact.subject,
        'message': contact.message,
      };
      await emailjs.send(
        Env.serviceId,
        Env.templateId,
        templateParams,
        emailjs.Options(
          publicKey: Env.publicKey,
          privateKey: Env.privateKey,
        ),
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
