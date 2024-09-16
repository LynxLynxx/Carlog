import 'package:carlog/core/error/failures.dart';
import 'package:carlog/web_features/web_contact/domain/entities/contact_entity.dart';
import 'package:carlog/web_features/web_contact/domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SendEmailUsecase {
  final ContactRepository _contactRepository;

  SendEmailUsecase(this._contactRepository);

  Future<Option<Failure>> call(ContactEntity contact) async =>
      await _contactRepository.sendEmail(contact);
}
