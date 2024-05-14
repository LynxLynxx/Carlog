// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "errorAborted":
            MessageLookupByLibrary.simpleMessage("The operation was aborted"),
        "errorAccountExists": MessageLookupByLibrary.simpleMessage(
            "Account exists with different credentials"),
        "errorAlreadyExists":
            MessageLookupByLibrary.simpleMessage("This data already exists"),
        "errorCancled":
            MessageLookupByLibrary.simpleMessage("The operation was cancelled"),
        "errorDataLoss": MessageLookupByLibrary.simpleMessage(
            "Your data was lost or corrupted"),
        "errorDeadlineExceeded": MessageLookupByLibrary.simpleMessage(
            "Operation couldn\'t be completed"),
        "errorEmailInUse":
            MessageLookupByLibrary.simpleMessage("Account already exists"),
        "errorFailedPrecondition": MessageLookupByLibrary.simpleMessage(
            "Operation was rejected, because system could\'nt procced with execution"),
        "errorInternal": MessageLookupByLibrary.simpleMessage(
            "Internal error occoured. Please try again later"),
        "errorInvalidArgument": MessageLookupByLibrary.simpleMessage(
            "Invalid arguemnt was specified"),
        "errorInvalidCerificationId": MessageLookupByLibrary.simpleMessage(
            "The verification id is invalid"),
        "errorInvalidCredential": MessageLookupByLibrary.simpleMessage(
            "The credential received are invalid"),
        "errorInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "Email is not valid or badly formatted"),
        "errorInvalidVerificationCode": MessageLookupByLibrary.simpleMessage(
            "The verification code is invalid"),
        "errorNotFound": MessageLookupByLibrary.simpleMessage(
            "Requested document was not found"),
        "errorOperationNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Operation is not allowed. Please contact support"),
        "errorOutOfRange": MessageLookupByLibrary.simpleMessage(
            "Operation was attempted past the valid range"),
        "errorResourceExhausted": MessageLookupByLibrary.simpleMessage(
            "Resources are not available at this time. Try again later"),
        "errorUnauthenticated": MessageLookupByLibrary.simpleMessage(
            "You don\'t have permission to perform this operation"),
        "errorUnavailable": MessageLookupByLibrary.simpleMessage(
            "The service is currently unavailable"),
        "errorUnimplemented": MessageLookupByLibrary.simpleMessage(
            "Operation is not implemented or not supported"),
        "errorUnknown":
            MessageLookupByLibrary.simpleMessage("Unkown error occurred"),
        "errorUserDisabled": MessageLookupByLibrary.simpleMessage(
            "The user as beddn disabled. Please contact support for help"),
        "errorUserNotFound": MessageLookupByLibrary.simpleMessage(
            "User with this credentials does not exists"),
        "errorWeakPassword": MessageLookupByLibrary.simpleMessage(
            "Please eneter a stronger password"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRecovery":
            MessageLookupByLibrary.simpleMessage("Password recovery"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "remindPassword":
            MessageLookupByLibrary.simpleMessage("Remind password")
      };
}
