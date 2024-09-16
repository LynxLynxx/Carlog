import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/web_features/web_contact/data/datasources/contact_datasource.dart';
import 'package:carlog/web_features/web_contact/domain/entities/contact_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ContactRepository {
  Future<Option<Failure>> sendEmail(ContactEntity contact);
}

@LazySingleton(as: ContactRepository)
class ContactRepositoryImpl implements ContactRepository {
  final ContactDatasource _contactDatasource;

  ContactRepositoryImpl() : _contactDatasource = ContactDatasourceImpl();

  @override
  Future<Option<Failure>> sendEmail(ContactEntity contact) async {
    return handleVoidResponse(
        () async => await _contactDatasource.sendEmail(contact));
  }
}
