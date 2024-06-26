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

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Electric cars`
  String get electricCars {
    return Intl.message(
      'Electric cars',
      name: 'electricCars',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications about upcoming services and planned repairs!`
  String get bodyReciveNotifications {
    return Intl.message(
      'Receive notifications about upcoming services and planned repairs!',
      name: 'bodyReciveNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Have access to preview statistics on car expenses!`
  String get bodyAnalyticsTutorial {
    return Intl.message(
      'Have access to preview statistics on car expenses!',
      name: 'bodyAnalyticsTutorial',
      desc: '',
      args: [],
    );
  }

  /// `Are you getting an electric car? We support them too!`
  String get bodyElectricCarsTutorial {
    return Intl.message(
      'Are you getting an electric car? We support them too!',
      name: 'bodyElectricCarsTutorial',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welocomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welocomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Create Account!`
  String get createAccount {
    return Intl.message(
      'Create Account!',
      name: 'createAccount',
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

  /// `The vehicle brand name should be between 2 and 20 characters`
  String get carBrandValidator {
    return Intl.message(
      'The vehicle brand name should be between 2 and 20 characters',
      name: 'carBrandValidator',
      desc: '',
      args: [],
    );
  }

  /// `The vehicle model name should be between 1 and 30 characters`
  String get carModelValidator {
    return Intl.message(
      'The vehicle model name should be between 1 and 30 characters',
      name: 'carModelValidator',
      desc: '',
      args: [],
    );
  }

  /// `The vehicle year of manufacture should be 4 characters`
  String get carYearValidator {
    return Intl.message(
      'The vehicle year of manufacture should be 4 characters',
      name: 'carYearValidator',
      desc: '',
      args: [],
    );
  }

  /// `The vehicle plate should be between 1 and 15 characters`
  String get carPlateValidator {
    return Intl.message(
      'The vehicle plate should be between 1 and 15 characters',
      name: 'carPlateValidator',
      desc: '',
      args: [],
    );
  }

  /// `The engine capacity should be between 1 and 7 digits`
  String get engineCapacityValidator {
    return Intl.message(
      'The engine capacity should be between 1 and 7 digits',
      name: 'engineCapacityValidator',
      desc: '',
      args: [],
    );
  }

  /// `The engine power should be between 1 and 4 digits`
  String get enginePowerValidator {
    return Intl.message(
      'The engine power should be between 1 and 4 digits',
      name: 'enginePowerValidator',
      desc: '',
      args: [],
    );
  }

  /// `Successfully added the vehicle`
  String get successfullyAddedTheVehicle {
    return Intl.message(
      'Successfully added the vehicle',
      name: 'successfullyAddedTheVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Successfully edited the vehicle`
  String get successfullyEditedTheVehicle {
    return Intl.message(
      'Successfully edited the vehicle',
      name: 'successfullyEditedTheVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Successfully deleted the vehicle`
  String get successfullyDeletedTheVehicle {
    return Intl.message(
      'Successfully deleted the vehicle',
      name: 'successfullyDeletedTheVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Add Car`
  String get addCar {
    return Intl.message(
      'Add Car',
      name: 'addCar',
      desc: '',
      args: [],
    );
  }

  /// `Update Car`
  String get updateCar {
    return Intl.message(
      'Update Car',
      name: 'updateCar',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this vehicle?`
  String get deleteVehicleConfirmation {
    return Intl.message(
      'Are you sure you want to delete this vehicle?',
      name: 'deleteVehicleConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Liters should be between 1 and 4 digits`
  String get litersValidator {
    return Intl.message(
      'Liters should be between 1 and 4 digits',
      name: 'litersValidator',
      desc: '',
      args: [],
    );
  }

  /// `Price should be between 1 and 5 digits`
  String get priceValidator {
    return Intl.message(
      'Price should be between 1 and 5 digits',
      name: 'priceValidator',
      desc: '',
      args: [],
    );
  }

  /// `Milage should be between 1 and 8 digits`
  String get milageValidator {
    return Intl.message(
      'Milage should be between 1 and 8 digits',
      name: 'milageValidator',
      desc: '',
      args: [],
    );
  }

  /// `Price should be between 1 and 8 digits`
  String get pricePerLiterValidator {
    return Intl.message(
      'Price should be between 1 and 8 digits',
      name: 'pricePerLiterValidator',
      desc: '',
      args: [],
    );
  }

  /// `Cars`
  String get cars {
    return Intl.message(
      'Cars',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully created your car!`
  String get youHaveSuccessfullyCreatedYourCar {
    return Intl.message(
      'You have successfully created your car!',
      name: 'youHaveSuccessfullyCreatedYourCar',
      desc: '',
      args: [],
    );
  }

  /// `Unable to locate your brand?`
  String get unableToLocateYourBrand {
    return Intl.message(
      'Unable to locate your brand?',
      name: 'unableToLocateYourBrand',
      desc: '',
      args: [],
    );
  }

  /// `Enter it manually!`
  String get enterItManually {
    return Intl.message(
      'Enter it manually!',
      name: 'enterItManually',
      desc: '',
      args: [],
    );
  }

  /// `Car Brand`
  String get carBrand {
    return Intl.message(
      'Car Brand',
      name: 'carBrand',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Volvo`
  String get egVolvo {
    return Intl.message(
      'e.g. Volvo',
      name: 'egVolvo',
      desc: '',
      args: [],
    );
  }

  /// `Year of production`
  String get yearOfProduction {
    return Intl.message(
      'Year of production',
      name: 'yearOfProduction',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 2024`
  String get eg2024 {
    return Intl.message(
      'e.g. 2024',
      name: 'eg2024',
      desc: '',
      args: [],
    );
  }

  /// `Milage`
  String get milage {
    return Intl.message(
      'Milage',
      name: 'milage',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 10 000`
  String get eg10000 {
    return Intl.message(
      'e.g. 10 000',
      name: 'eg10000',
      desc: '',
      args: [],
    );
  }

  /// `Plate`
  String get plate {
    return Intl.message(
      'Plate',
      name: 'plate',
      desc: '',
      args: [],
    );
  }

  /// `e.g. AUM 550`
  String get egAUM550 {
    return Intl.message(
      'e.g. AUM 550',
      name: 'egAUM550',
      desc: '',
      args: [],
    );
  }

  /// `Unable to locate your model?`
  String get unableToLocateYourModel {
    return Intl.message(
      'Unable to locate your model?',
      name: 'unableToLocateYourModel',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get carModel {
    return Intl.message(
      'Car Model',
      name: 'carModel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. XC90`
  String get egXC90 {
    return Intl.message(
      'e.g. XC90',
      name: 'egXC90',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `e.g. SUV`
  String get egSUV {
    return Intl.message(
      'e.g. SUV',
      name: 'egSUV',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Type`
  String get fuelType {
    return Intl.message(
      'Fuel Type',
      name: 'fuelType',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Hybrid`
  String get egHybrid {
    return Intl.message(
      'e.g. Hybrid',
      name: 'egHybrid',
      desc: '',
      args: [],
    );
  }

  /// `Engine Capacity`
  String get engineCapacity {
    return Intl.message(
      'Engine Capacity',
      name: 'engineCapacity',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 1984`
  String get eg1984 {
    return Intl.message(
      'e.g. 1984',
      name: 'eg1984',
      desc: '',
      args: [],
    );
  }

  /// `Engine Power`
  String get enginePower {
    return Intl.message(
      'Engine Power',
      name: 'enginePower',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 163`
  String get eg163 {
    return Intl.message(
      'e.g. 163',
      name: 'eg163',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
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
