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

  static String m0(isPositive) => "${Intl.select(isPositive, {
            'true': 'Less this month',
            'other': 'More this month',
          })}";

  static String m1(language) => "${Intl.select(language, {
            'pl': 'Polish',
            'en': 'English',
            'other': 'Spanish',
          })}";

  static String m2(theme) => "${Intl.select(theme, {
            'light': 'light',
            'other': 'dark',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("About the app"),
        "aboutUsDescription": MessageLookupByLibrary.simpleMessage(
            "The Carlog application was created by RS Apps, which has been on the market since 2023 and has cooperated with several companies. If you are interested in cooperation, contact us."),
        "account": MessageLookupByLibrary.simpleMessage("ACCOUNT"),
        "action": MessageLookupByLibrary.simpleMessage("Action"),
        "addAction": MessageLookupByLibrary.simpleMessage("Add Action"),
        "addCar": MessageLookupByLibrary.simpleMessage("Add Car"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "addressValidator": MessageLookupByLibrary.simpleMessage(
            "Address should be between 1 and 100 characters"),
        "allExpenses": MessageLookupByLibrary.simpleMessage("All"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "bodyAnalyticsTutorial": MessageLookupByLibrary.simpleMessage(
            "Have access to preview statistics on car expenses!"),
        "bodyElectricCarsTutorial": MessageLookupByLibrary.simpleMessage(
            "Are you getting an electric car? We support them too!"),
        "bodyReciveNotifications": MessageLookupByLibrary.simpleMessage(
            "Receive notifications about upcoming services and planned repairs!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "carBrand": MessageLookupByLibrary.simpleMessage("Car Brand"),
        "carBrandValidator": MessageLookupByLibrary.simpleMessage(
            "The vehicle brand name should be between 2 and 20 characters"),
        "carModel": MessageLookupByLibrary.simpleMessage("Car Model"),
        "carModelValidator": MessageLookupByLibrary.simpleMessage(
            "The vehicle model name should be between 1 and 30 characters"),
        "carPlateValidator": MessageLookupByLibrary.simpleMessage(
            "The vehicle plate should be between 1 and 15 characters"),
        "carWash": MessageLookupByLibrary.simpleMessage("Car Wash"),
        "carYearValidator": MessageLookupByLibrary.simpleMessage(
            "The vehicle year of manufacture should be 4 characters"),
        "cars": MessageLookupByLibrary.simpleMessage("Cars"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "colorTheme": MessageLookupByLibrary.simpleMessage("Color Theme"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "congratulations":
            MessageLookupByLibrary.simpleMessage("Congratulations!"),
        "contact": MessageLookupByLibrary.simpleMessage("Contact"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "coordinatesValidator": MessageLookupByLibrary.simpleMessage(
            "Coordinates should be between 1 and 25 characters"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Create Account!"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Current password"),
        "customize": MessageLookupByLibrary.simpleMessage("CUSTOMIZE"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "deleteAcount": MessageLookupByLibrary.simpleMessage("Delete Account"),
        "deleteData": MessageLookupByLibrary.simpleMessage("Delete Data"),
        "deleteVehicleConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this vehicle?"),
        "developer": MessageLookupByLibrary.simpleMessage("Mobile Developer"),
        "doYouReallyWantToDeleteYourAccount": MessageLookupByLibrary.simpleMessage(
            "Do you really want to delete your account? This action is irreversible, and all your data will be permanently lost."),
        "editExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
        "eg100": MessageLookupByLibrary.simpleMessage("e.g. 100"),
        "eg10000": MessageLookupByLibrary.simpleMessage("e.g. 10 000"),
        "eg163": MessageLookupByLibrary.simpleMessage("e.g. 163"),
        "eg1984": MessageLookupByLibrary.simpleMessage("e.g. 1984"),
        "eg2024": MessageLookupByLibrary.simpleMessage("e.g. 2024"),
        "eg20240101": MessageLookupByLibrary.simpleMessage("e.g. 2024-01-01"),
        "egAUM550": MessageLookupByLibrary.simpleMessage("e.g. AUM 550"),
        "egEuro": MessageLookupByLibrary.simpleMessage("e.g. Euro"),
        "egHybrid": MessageLookupByLibrary.simpleMessage("e.g. Hybrid"),
        "egOilFilterReplacementIncluded": MessageLookupByLibrary.simpleMessage(
            "e.g. Oil filter replacement included"),
        "egRememberToChangeTheOil": MessageLookupByLibrary.simpleMessage(
            "e.g. Remember to change the oil"),
        "egSUV": MessageLookupByLibrary.simpleMessage("e.g. SUV"),
        "egService": MessageLookupByLibrary.simpleMessage("e.g. Service"),
        "egVolvo": MessageLookupByLibrary.simpleMessage("e.g. Volvo"),
        "egWalkway": MessageLookupByLibrary.simpleMessage(
            "e.g. Walkway, 10004, NY, United States"),
        "egXC90": MessageLookupByLibrary.simpleMessage("e.g. XC90"),
        "electricCars": MessageLookupByLibrary.simpleMessage("Electric cars"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "engineCapacity":
            MessageLookupByLibrary.simpleMessage("Engine Capacity"),
        "engineCapacityValidator": MessageLookupByLibrary.simpleMessage(
            "The engine capacity should be between 1 and 7 digits"),
        "enginePower": MessageLookupByLibrary.simpleMessage("Engine Power"),
        "enginePowerValidator": MessageLookupByLibrary.simpleMessage(
            "The engine power should be between 1 and 4 digits"),
        "enterItManually":
            MessageLookupByLibrary.simpleMessage("Enter it manually!"),
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
            "Operation couldn\'\'t be completed"),
        "errorEmailInUse":
            MessageLookupByLibrary.simpleMessage("Account already exists"),
        "errorFailedPrecondition": MessageLookupByLibrary.simpleMessage(
            "Operation was rejected, because system couldn\'\'t procced with execution"),
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
            "You don\'\'t have permission to perform this operation"),
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
        "expense": MessageLookupByLibrary.simpleMessage("Expense"),
        "expenseByDt": MessageLookupByLibrary.simpleMessage("Expense by date"),
        "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
        "expensesByType":
            MessageLookupByLibrary.simpleMessage("Expenses by type"),
        "feedback": MessageLookupByLibrary.simpleMessage("FEEDBACK"),
        "feelFreeToReachOut": MessageLookupByLibrary.simpleMessage(
            "Feel free to reach out to us at any time, and we’ll get back to you as quickly as possible. Your questions and feedback are important to us!"),
        "file": MessageLookupByLibrary.simpleMessage("File"),
        "fuelType": MessageLookupByLibrary.simpleMessage("Fuel Type"),
        "getCarlogNow": MessageLookupByLibrary.simpleMessage(
            "Get Carlog now and take control of your car\'s history. Available on the App Store and Google Play."),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "information": MessageLookupByLibrary.simpleMessage("Information"),
        "insurance": MessageLookupByLibrary.simpleMessage("Insurance"),
        "insuranceFee": MessageLookupByLibrary.simpleMessage("Insurance Fee"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "last5Expenses":
            MessageLookupByLibrary.simpleMessage("Last 5 expenses"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "leadDeveloper":
            MessageLookupByLibrary.simpleMessage("Lead Mobile Developer"),
        "legalInformation":
            MessageLookupByLibrary.simpleMessage("LEGAL INFORMATION"),
        "library": MessageLookupByLibrary.simpleMessage("Library"),
        "litersValidator": MessageLookupByLibrary.simpleMessage(
            "Liters should be between 1 and 4 digits"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "mailValidator":
            MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
        "mainDevelopers":
            MessageLookupByLibrary.simpleMessage("Main Developers"),
        "manageActions": MessageLookupByLibrary.simpleMessage("Manage Action"),
        "message": MessageLookupByLibrary.simpleMessage("Message"),
        "milage": MessageLookupByLibrary.simpleMessage("Milage"),
        "milageValidator": MessageLookupByLibrary.simpleMessage(
            "Milage should be between 1 and 8 digits"),
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "myAccount": MessageLookupByLibrary.simpleMessage("My Account"),
        "name": MessageLookupByLibrary.simpleMessage("First name"),
        "nameValidator": MessageLookupByLibrary.simpleMessage(
            "The name must contain at least 2 characters and a maximum of 30 characters"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noExpenses": MessageLookupByLibrary.simpleMessage(
            "Add expenses to see the statistics"),
        "notValidEmpty":
            MessageLookupByLibrary.simpleMessage("Field cannot be empty"),
        "note": MessageLookupByLibrary.simpleMessage("Note"),
        "noteValidator": MessageLookupByLibrary.simpleMessage(
            "Note should be between 2 and 100 characters"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "oilChange": MessageLookupByLibrary.simpleMessage("Oil Change"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "parkingFee": MessageLookupByLibrary.simpleMessage("Parking Fee"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRecovery":
            MessageLookupByLibrary.simpleMessage("Password recovery"),
        "passwordValidator": MessageLookupByLibrary.simpleMessage(
            "The password must contain at least one special character, uppercase and lowercase letter. The password must be at least 8 characters long."),
        "permissions": MessageLookupByLibrary.simpleMessage("PERMISSIONS"),
        "plate": MessageLookupByLibrary.simpleMessage("Plate"),
        "positiveChartText": m0,
        "pricePerLiterValidator": MessageLookupByLibrary.simpleMessage(
            "Price should be between 1 and 8 digits"),
        "priceValidator": MessageLookupByLibrary.simpleMessage(
            "Price should be between 1 and 5 digits"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "pushNotifications":
            MessageLookupByLibrary.simpleMessage("Push Notifications"),
        "regionCountry": MessageLookupByLibrary.simpleMessage("Region/Country"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "remindPassword":
            MessageLookupByLibrary.simpleMessage("Remind password"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat new password"),
        "reportProblem": MessageLookupByLibrary.simpleMessage("Report Problem"),
        "requestNewFeature":
            MessageLookupByLibrary.simpleMessage("Request New Feature"),
        "roadFee": MessageLookupByLibrary.simpleMessage("Road Fee"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send Email"),
        "sender": MessageLookupByLibrary.simpleMessage("Sender"),
        "service": MessageLookupByLibrary.simpleMessage("Service"),
        "serviceFee": MessageLookupByLibrary.simpleMessage("Service Fee"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
        "subject": MessageLookupByLibrary.simpleMessage("Subject"),
        "successfullyAddedTheActivity": MessageLookupByLibrary.simpleMessage(
            "Successfully added the activity"),
        "successfullyAddedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Successfully added the vehicle"),
        "successfullyDeletedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Successfully deleted the vehicle"),
        "successfullyEditedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Successfully edited the vehicle"),
        "successfullyUpdatedTheMilage": MessageLookupByLibrary.simpleMessage(
            "Successfully updated the milage"),
        "suggest": MessageLookupByLibrary.simpleMessage("Suggest"),
        "supportedLanguage": m1,
        "supportedThemes": m2,
        "tapOnTheMap": MessageLookupByLibrary.simpleMessage(
            "Tap on the map to set the location of the action."),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
        "tireChange": MessageLookupByLibrary.simpleMessage("Tire Change"),
        "tires": MessageLookupByLibrary.simpleMessage("Tires"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "tooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Too many requests. Try again later"),
        "trackSaveAnalyze":
            MessageLookupByLibrary.simpleMessage("Track, Save, Analyze"),
        "tuning": MessageLookupByLibrary.simpleMessage("Tuning"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "unableToLocateYourBrand": MessageLookupByLibrary.simpleMessage(
            "Unable to locate your brand?"),
        "unableToLocateYourModel": MessageLookupByLibrary.simpleMessage(
            "Unable to locate your model?"),
        "updateCar": MessageLookupByLibrary.simpleMessage("Update Car"),
        "updateMilage": MessageLookupByLibrary.simpleMessage("Update Milage"),
        "visitWebsite": MessageLookupByLibrary.simpleMessage("Visit Website"),
        "welocomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
        "yearOfProduction":
            MessageLookupByLibrary.simpleMessage("Year of production"),
        "youDontHaveAnPlannedActivity": MessageLookupByLibrary.simpleMessage(
            "You don’t have an planned activity yet."),
        "youHaveNoCarsYet": MessageLookupByLibrary.simpleMessage(
            "You have no cars yet, add one!"),
        "youHaveSuccessfullyCreatedYourCar":
            MessageLookupByLibrary.simpleMessage(
                "You have successfully created your car!"),
        "yourCarsJourney":
            MessageLookupByLibrary.simpleMessage("Your Car\'s journey"),
        "yourMessageHasBeenSent": MessageLookupByLibrary.simpleMessage(
            "Your message has been sent successfully!")
      };
}
