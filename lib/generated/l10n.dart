// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Remind password`
  String get remindPassword {
    return Intl.message(
      'Remind password',
      name: 'remindPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password recovery`
  String get passwordRecovery {
    return Intl.message(
      'Password recovery',
      name: 'passwordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Account exists with different credentials`
  String get errorAccountExists {
    return Intl.message(
      'Account exists with different credentials',
      name: 'errorAccountExists',
      desc: '',
      args: [],
    );
  }

  /// `The credential received are invalid`
  String get errorInvalidCredential {
    return Intl.message(
      'The credential received are invalid',
      name: 'errorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Operation is not allowed. Please contact support`
  String get errorOperationNotAllowed {
    return Intl.message(
      'Operation is not allowed. Please contact support',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `The user as beddn disabled. Please contact support for help`
  String get errorUserDisabled {
    return Intl.message(
      'The user as beddn disabled. Please contact support for help',
      name: 'errorUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `User with this credentials does not exists`
  String get errorUserNotFound {
    return Intl.message(
      'User with this credentials does not exists',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The verification code is invalid`
  String get errorInvalidVerificationCode {
    return Intl.message(
      'The verification code is invalid',
      name: 'errorInvalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The verification id is invalid`
  String get errorInvalidCerificationId {
    return Intl.message(
      'The verification id is invalid',
      name: 'errorInvalidCerificationId',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid or badly formatted`
  String get errorInvalidEmail {
    return Intl.message(
      'Email is not valid or badly formatted',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists`
  String get errorEmailInUse {
    return Intl.message(
      'Account already exists',
      name: 'errorEmailInUse',
      desc: '',
      args: [],
    );
  }

  /// `Please eneter a stronger password`
  String get errorWeakPassword {
    return Intl.message(
      'Please eneter a stronger password',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The operation was aborted`
  String get errorAborted {
    return Intl.message(
      'The operation was aborted',
      name: 'errorAborted',
      desc: '',
      args: [],
    );
  }

  /// `This data already exists`
  String get errorAlreadyExists {
    return Intl.message(
      'This data already exists',
      name: 'errorAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled`
  String get errorCancled {
    return Intl.message(
      'The operation was cancelled',
      name: 'errorCancled',
      desc: '',
      args: [],
    );
  }

  /// `Your data was lost or corrupted`
  String get errorDataLoss {
    return Intl.message(
      'Your data was lost or corrupted',
      name: 'errorDataLoss',
      desc: '',
      args: [],
    );
  }

  /// `Operation couldn't be completed`
  String get errorDeadlineExceeded {
    return Intl.message(
      'Operation couldn\'t be completed',
      name: 'errorDeadlineExceeded',
      desc: '',
      args: [],
    );
  }

  /// `Operation was rejected, because system could'nt procced with execution`
  String get errorFailedPrecondition {
    return Intl.message(
      'Operation was rejected, because system could\'nt procced with execution',
      name: 'errorFailedPrecondition',
      desc: '',
      args: [],
    );
  }

  /// `Internal error occoured. Please try again later`
  String get errorInternal {
    return Intl.message(
      'Internal error occoured. Please try again later',
      name: 'errorInternal',
      desc: '',
      args: [],
    );
  }

  /// `Invalid arguemnt was specified`
  String get errorInvalidArgument {
    return Intl.message(
      'Invalid arguemnt was specified',
      name: 'errorInvalidArgument',
      desc: '',
      args: [],
    );
  }

  /// `Requested document was not found`
  String get errorNotFound {
    return Intl.message(
      'Requested document was not found',
      name: 'errorNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Operation was attempted past the valid range`
  String get errorOutOfRange {
    return Intl.message(
      'Operation was attempted past the valid range',
      name: 'errorOutOfRange',
      desc: '',
      args: [],
    );
  }

  /// `Resources are not available at this time. Try again later`
  String get errorResourceExhausted {
    return Intl.message(
      'Resources are not available at this time. Try again later',
      name: 'errorResourceExhausted',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this operation`
  String get errorUnauthenticated {
    return Intl.message(
      'You don\'t have permission to perform this operation',
      name: 'errorUnauthenticated',
      desc: '',
      args: [],
    );
  }

  /// `The service is currently unavailable`
  String get errorUnavailable {
    return Intl.message(
      'The service is currently unavailable',
      name: 'errorUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Operation is not implemented or not supported`
  String get errorUnimplemented {
    return Intl.message(
      'Operation is not implemented or not supported',
      name: 'errorUnimplemented',
      desc: '',
      args: [],
    );
  }

  /// `Unkown error occurred`
  String get errorUnknown {
    return Intl.message(
      'Unkown error occurred',
      name: 'errorUnknown',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
