// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m1(language) => "${Intl.select(language, {
            'en': 'angielski',
            'es': 'hiszpański',
            'pl': 'polski',
            'other': 'hiszpański',
          })}";

  static String m2(theme) => "${Intl.select(theme, {
            'dark': 'ciemny',
            'light': 'jasny',
            'other': 'ciemny',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("O aplikacji"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("O aplikacji"),
        "aboutUsDescription": MessageLookupByLibrary.simpleMessage(
            "Aplikacja Carlog została stworzona przez RS Apps, które od 2023 roku jest na rynku i współpracowało z kilkoma firmami. Jeśli jesteś zainteresowany współpracą, skontaktuj się z nami."),
        "account": MessageLookupByLibrary.simpleMessage("KONTO"),
        "action": MessageLookupByLibrary.simpleMessage("Akcja"),
        "addAction": MessageLookupByLibrary.simpleMessage("Dodaj działanie"),
        "addCar": MessageLookupByLibrary.simpleMessage("Dodaj samochód"),
        "address": MessageLookupByLibrary.simpleMessage("Adres"),
        "addressValidator": MessageLookupByLibrary.simpleMessage(
            "Adres powinien zawierać od 1 do 100 znaków"),
        "amount": MessageLookupByLibrary.simpleMessage("Kwota"),
        "analytics": MessageLookupByLibrary.simpleMessage("Analityka"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("Jesteś pewien?"),
        "bodyAnalyticsTutorial": MessageLookupByLibrary.simpleMessage(
            "Uzyskaj dostęp do szczegółowych statystyk wydatków na samochód!"),
        "bodyElectricCarsTutorial": MessageLookupByLibrary.simpleMessage(
            "Posiadasz samochód elektryczny? My również go wspieramy!"),
        "bodyReciveNotifications": MessageLookupByLibrary.simpleMessage(
            "Otrzymuj powiadomienia o nadchodzących serwisach i planowanych naprawach!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "carBrand": MessageLookupByLibrary.simpleMessage("Marka samochodu"),
        "carBrandValidator": MessageLookupByLibrary.simpleMessage(
            "Nazwa marki pojazdu powinna zawierać od 2 do 20 znaków."),
        "carModel": MessageLookupByLibrary.simpleMessage("Model samochodu"),
        "carModelValidator": MessageLookupByLibrary.simpleMessage(
            "Nazwa modelu pojazdu powinna zawierać od 1 do 30 znaków."),
        "carPlateValidator": MessageLookupByLibrary.simpleMessage(
            "Numer rejestracyjny pojazdu powinien zawierać od 1 do 15 znaków."),
        "carWash": MessageLookupByLibrary.simpleMessage("Myjnia samochodowa"),
        "carYearValidator": MessageLookupByLibrary.simpleMessage(
            "Rok produkcji pojazdu powinien zawierać 4 znaki."),
        "cars": MessageLookupByLibrary.simpleMessage("Samochody"),
        "changePassword": MessageLookupByLibrary.simpleMessage("Zmień hasło"),
        "colorTheme":
            MessageLookupByLibrary.simpleMessage("Motyw kolorystyczny"),
        "confirm": MessageLookupByLibrary.simpleMessage("Potwierdź"),
        "congratulations": MessageLookupByLibrary.simpleMessage("Gratulacje!"),
        "contact": MessageLookupByLibrary.simpleMessage("Kontakt"),
        "contactUs":
            MessageLookupByLibrary.simpleMessage("Skontaktuj się z nami"),
        "coordinatesValidator": MessageLookupByLibrary.simpleMessage(
            "Współrzędne powinny zawierać od 1 do 25 znaków"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Utwórz konto!"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Hasło bieżące"),
        "customize": MessageLookupByLibrary.simpleMessage("DOSTOSUJ"),
        "date": MessageLookupByLibrary.simpleMessage("Data"),
        "deleteAcount": MessageLookupByLibrary.simpleMessage("Usuń konto"),
        "deleteData": MessageLookupByLibrary.simpleMessage("Usuń dane"),
        "deleteVehicleConfirmation": MessageLookupByLibrary.simpleMessage(
            "Czy na pewno chcesz usunąć ten pojazd?"),
        "developer": MessageLookupByLibrary.simpleMessage("Mobile Developer"),
        "doYouReallyWantToDeleteYourAccount": MessageLookupByLibrary.simpleMessage(
            "Czy jesteś pewien, że chcesz usunąć swoje konto? Ta akcja jest nieodwracalna, a wszystkie Twoje dane zostaną trwale utracone."),
        "eg100": MessageLookupByLibrary.simpleMessage("np. 100"),
        "eg10000": MessageLookupByLibrary.simpleMessage("np. 10 000"),
        "eg163": MessageLookupByLibrary.simpleMessage("np. 163"),
        "eg1984": MessageLookupByLibrary.simpleMessage("np. 1984"),
        "eg2024": MessageLookupByLibrary.simpleMessage("np. 2024"),
        "eg20240101": MessageLookupByLibrary.simpleMessage("np. 2024-01-01"),
        "egAUM550": MessageLookupByLibrary.simpleMessage("np. AUM 550"),
        "egEuro": MessageLookupByLibrary.simpleMessage("np. Euro"),
        "egHybrid": MessageLookupByLibrary.simpleMessage("np. Hybrid"),
        "egOilFilterReplacementIncluded": MessageLookupByLibrary.simpleMessage(
            "np. wymiana filtra oleju wliczona"),
        "egRememberToChangeTheOil": MessageLookupByLibrary.simpleMessage(
            "np. Pamiętaj o wymianie oleju"),
        "egSUV": MessageLookupByLibrary.simpleMessage("np. SUV"),
        "egService": MessageLookupByLibrary.simpleMessage("np. Serwis"),
        "egVolvo": MessageLookupByLibrary.simpleMessage("np. Volvo"),
        "egWalkway": MessageLookupByLibrary.simpleMessage(
            "np. Aleja, 10004, Nowy Jork, Stany Zjednoczone"),
        "egXC90": MessageLookupByLibrary.simpleMessage("np. XC90"),
        "electricCars":
            MessageLookupByLibrary.simpleMessage("Samochody elektryczne"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "engineCapacity":
            MessageLookupByLibrary.simpleMessage("Pojemność silnika"),
        "engineCapacityValidator": MessageLookupByLibrary.simpleMessage(
            "Pojemność silnika powinna zawierać od 1 do 7 cyfr."),
        "enginePower": MessageLookupByLibrary.simpleMessage("Moc silnika"),
        "enginePowerValidator": MessageLookupByLibrary.simpleMessage(
            "Moc silnika powinna zawierać od 1 do 4 cyfr."),
        "enterItManually":
            MessageLookupByLibrary.simpleMessage("Wpisz ją ręcznie!"),
        "errorAborted":
            MessageLookupByLibrary.simpleMessage("Operacja została przerwana"),
        "errorAccountExists": MessageLookupByLibrary.simpleMessage(
            "Konto istnieje z innymi poświadczeniami"),
        "errorAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Te dane już istnieją"),
        "errorCancled":
            MessageLookupByLibrary.simpleMessage("Operacja została anulowana"),
        "errorDataLoss": MessageLookupByLibrary.simpleMessage(
            "Twoje dane zostały utracone lub uszkodzone"),
        "errorDeadlineExceeded":
            MessageLookupByLibrary.simpleMessage("Operacji nie można ukończyć"),
        "errorEmailInUse":
            MessageLookupByLibrary.simpleMessage("Konto już istnieje"),
        "errorFailedPrecondition": MessageLookupByLibrary.simpleMessage(
            "Operacja została odrzucona, ponieważ system nie mógł kontynuować wykonania"),
        "errorInternal": MessageLookupByLibrary.simpleMessage(
            "Wystąpił błąd wewnętrzny. Spróbuj ponownie później"),
        "errorInvalidArgument": MessageLookupByLibrary.simpleMessage(
            "Podano nieprawidłowy argument"),
        "errorInvalidCerificationId": MessageLookupByLibrary.simpleMessage(
            "Identyfikator weryfikacji jest nieprawidłowy"),
        "errorInvalidCredential": MessageLookupByLibrary.simpleMessage(
            "Otrzymane poświadczenia są nieprawidłowe"),
        "errorInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "Email jest nieprawidłowy lub ma zły format"),
        "errorInvalidVerificationCode": MessageLookupByLibrary.simpleMessage(
            "Kod weryfikacyjny jest nieprawidłowy"),
        "errorNotFound": MessageLookupByLibrary.simpleMessage(
            "Żądany dokument nie został znaleziony"),
        "errorOperationNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Operacja jest niedozwolona. Skontaktuj się z pomocą techniczną"),
        "errorOutOfRange": MessageLookupByLibrary.simpleMessage(
            "Próba operacji poza prawidłowym zakresem"),
        "errorResourceExhausted": MessageLookupByLibrary.simpleMessage(
            "Zasoby nie są obecnie dostępne. Spróbuj ponownie później"),
        "errorUnauthenticated": MessageLookupByLibrary.simpleMessage(
            "Nie masz uprawnień do wykonania tej operacji"),
        "errorUnavailable": MessageLookupByLibrary.simpleMessage(
            "Usługa jest obecnie niedostępna"),
        "errorUnimplemented": MessageLookupByLibrary.simpleMessage(
            "Operacja nie jest zrealizowana lub nie jest obsługiwana"),
        "errorUnknown":
            MessageLookupByLibrary.simpleMessage("Wystąpił nieznany błąd"),
        "errorUserDisabled": MessageLookupByLibrary.simpleMessage(
            "Użytkownik został wyłączony. Skontaktuj się z pomocą techniczną w celu uzyskania pomocy"),
        "errorUserNotFound": MessageLookupByLibrary.simpleMessage(
            "Użytkownik z tymi poświadczeniami nie istnieje"),
        "errorWeakPassword":
            MessageLookupByLibrary.simpleMessage("Podaj silniejsze hasło"),
        "expense": MessageLookupByLibrary.simpleMessage("Wydatek"),
        "feedback": MessageLookupByLibrary.simpleMessage("OPINIE"),
        "feelFreeToReachOut": MessageLookupByLibrary.simpleMessage(
            "Zapraszamy do kontaktu z nami w dowolnej chwili. Odpowiemy tak szybko, jak to możliwe. Pytania i opinie są dla nas ważne!"),
        "file": MessageLookupByLibrary.simpleMessage("Plik"),
        "fuelType": MessageLookupByLibrary.simpleMessage("Rodzaj paliwa"),
        "getCarlogNow": MessageLookupByLibrary.simpleMessage(
            "Pobierz Carlog już teraz i kontroluj historię swojego samochodu. Dostępne w App Store i Google Play."),
        "getStarted": MessageLookupByLibrary.simpleMessage("Rozpocznij"),
        "home": MessageLookupByLibrary.simpleMessage("Strona główna"),
        "information": MessageLookupByLibrary.simpleMessage("Informacje"),
        "insurance": MessageLookupByLibrary.simpleMessage("Ubezpieczenie"),
        "insuranceFee":
            MessageLookupByLibrary.simpleMessage("Opłata za ubezpieczenie"),
        "language": MessageLookupByLibrary.simpleMessage("Język"),
        "lastName": MessageLookupByLibrary.simpleMessage("Nazwisko"),
        "leadDeveloper":
            MessageLookupByLibrary.simpleMessage("Lead Mobile Developer"),
        "legalInformation":
            MessageLookupByLibrary.simpleMessage("INFORMACJE PRAWNE"),
        "library": MessageLookupByLibrary.simpleMessage("Biblioteka"),
        "litersValidator": MessageLookupByLibrary.simpleMessage(
            "Pojemność w litrach powinna zawierać od 1 do 4 cyfr."),
        "logOut": MessageLookupByLibrary.simpleMessage("Wyloguj się"),
        "login": MessageLookupByLibrary.simpleMessage("Logowanie"),
        "mailValidator": MessageLookupByLibrary.simpleMessage(
            "Wpisz poprawny adres e-mail."),
        "mainDevelopers":
            MessageLookupByLibrary.simpleMessage("Główni deweloperzy"),
        "manageActions":
            MessageLookupByLibrary.simpleMessage("Zarządzaj działaniami"),
        "message": MessageLookupByLibrary.simpleMessage("Wiadomość"),
        "milage": MessageLookupByLibrary.simpleMessage("Przebieg"),
        "milageValidator": MessageLookupByLibrary.simpleMessage(
            "Przebieg powinien zawierać od 1 do 8 cyfr."),
        "myAccount": MessageLookupByLibrary.simpleMessage("Moje konto"),
        "name": MessageLookupByLibrary.simpleMessage("Imię"),
        "nameValidator": MessageLookupByLibrary.simpleMessage(
            "Nazwa musi zawierać co najmniej 2 znaki i maksymalnie 30 znaków"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Nowe hasło"),
        "next": MessageLookupByLibrary.simpleMessage("Dalej"),
        "notValidEmpty":
            MessageLookupByLibrary.simpleMessage("Pole nie może być puste"),
        "note": MessageLookupByLibrary.simpleMessage("Notatka"),
        "noteValidator": MessageLookupByLibrary.simpleMessage(
            "Notatka powinna mieć od 2 do 100 znaków"),
        "notifications": MessageLookupByLibrary.simpleMessage("Powiadomienia"),
        "oilChange": MessageLookupByLibrary.simpleMessage("Wymiana oleju"),
        "or": MessageLookupByLibrary.simpleMessage("LUB"),
        "other": MessageLookupByLibrary.simpleMessage("Inne"),
        "parkingFee": MessageLookupByLibrary.simpleMessage("Opłata parkingowa"),
        "password": MessageLookupByLibrary.simpleMessage("Hasło"),
        "passwordRecovery":
            MessageLookupByLibrary.simpleMessage("Odzyskiwanie hasła"),
        "passwordValidator": MessageLookupByLibrary.simpleMessage(
            "Hasło musi zawierać co najmniej jeden znak specjalny, dużą i małą literę. Hasło musi mieć co najmniej 8 znaków."),
        "permissions": MessageLookupByLibrary.simpleMessage("UPRAWNIENIA"),
        "plate": MessageLookupByLibrary.simpleMessage("Numer rejestracyjny"),
        "pricePerLiterValidator": MessageLookupByLibrary.simpleMessage(
            "Cena powinna zawierać od 1 do 8 cyfr."),
        "priceValidator": MessageLookupByLibrary.simpleMessage(
            "Cena powinna zawierać od 1 do 5 cyfr."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Polityka prywatności"),
        "pushNotifications":
            MessageLookupByLibrary.simpleMessage("Powiadomienia push"),
        "regionCountry": MessageLookupByLibrary.simpleMessage("Region/Kraj"),
        "register": MessageLookupByLibrary.simpleMessage("Rejestracja"),
        "remindPassword":
            MessageLookupByLibrary.simpleMessage("Przypomnij hasło"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Powtórz nowe hasło"),
        "reportProblem": MessageLookupByLibrary.simpleMessage("Zgłoś problem"),
        "requestNewFeature":
            MessageLookupByLibrary.simpleMessage("Poproś o nową funkcję"),
        "roadFee": MessageLookupByLibrary.simpleMessage("Opłata drogowa"),
        "save": MessageLookupByLibrary.simpleMessage("Zapisz"),
        "send": MessageLookupByLibrary.simpleMessage("Wyślij"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Wyślij E-mail"),
        "sender": MessageLookupByLibrary.simpleMessage("Nadawca"),
        "service": MessageLookupByLibrary.simpleMessage("Usługa"),
        "serviceFee": MessageLookupByLibrary.simpleMessage("Opłata za usługę"),
        "settings": MessageLookupByLibrary.simpleMessage("Ustawienia"),
        "skip": MessageLookupByLibrary.simpleMessage("Pomiń"),
        "subject": MessageLookupByLibrary.simpleMessage("Temat"),
        "successfullyAddedTheActivity":
            MessageLookupByLibrary.simpleMessage("Aktywność dodana pomyślnie"),
        "successfullyAddedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Pojazd został pomyślnie dodany."),
        "successfullyDeletedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Pojazd został pomyślnie usunięty."),
        "successfullyEditedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Pojazd został pomyślnie edytowany."),
        "successfullyUpdatedTheMilage": MessageLookupByLibrary.simpleMessage(
            "Przebieg zaktualizowany pomyślnie"),
        "suggest": MessageLookupByLibrary.simpleMessage("Proponuj"),
        "supportedLanguage": m1,
        "supportedThemes": m2,
        "tapOnTheMap": MessageLookupByLibrary.simpleMessage(
            "Naciśnij na mapie, aby ustawić lokalizację akcji."),
        "termsOfUse":
            MessageLookupByLibrary.simpleMessage("Warunki korzystania"),
        "tireChange": MessageLookupByLibrary.simpleMessage("Wymiana opon"),
        "tires": MessageLookupByLibrary.simpleMessage("Opony"),
        "today": MessageLookupByLibrary.simpleMessage("Dzisiaj"),
        "tooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Zbyt wiele żądań. Spróbuj ponownie później."),
        "trackSaveAnalyze":
            MessageLookupByLibrary.simpleMessage("Śledź, zapisuj, analizuj"),
        "tuning": MessageLookupByLibrary.simpleMessage("Tuning"),
        "type": MessageLookupByLibrary.simpleMessage("Typ"),
        "unableToLocateYourBrand": MessageLookupByLibrary.simpleMessage(
            "Nie możesz znaleźć swojej marki?"),
        "unableToLocateYourModel": MessageLookupByLibrary.simpleMessage(
            "Nie możesz znaleźć swojego modelu?"),
        "updateCar":
            MessageLookupByLibrary.simpleMessage("Aktualizuj samochód"),
        "updateMilage":
            MessageLookupByLibrary.simpleMessage("Aktualizuj przebieg"),
        "visitWebsite": MessageLookupByLibrary.simpleMessage("Strona"),
        "welocomeBack":
            MessageLookupByLibrary.simpleMessage("Witamy ponownie!"),
        "yearOfProduction":
            MessageLookupByLibrary.simpleMessage("Rok produkcji"),
        "youDontHaveAnPlannedActivity": MessageLookupByLibrary.simpleMessage(
            "Nie masz jeszcze zaplanowanej aktywności."),
        "youHaveNoCarsYet": MessageLookupByLibrary.simpleMessage(
            "Nie masz jeszcze żadnych samochodów, dodaj jeden!"),
        "youHaveSuccessfullyCreatedYourCar":
            MessageLookupByLibrary.simpleMessage(
                "Pomyślnie utworzyłeś swój samochód!"),
        "yourCarsJourney":
            MessageLookupByLibrary.simpleMessage("Podróż Twojego samochodu"),
        "yourMessageHasBeenSent": MessageLookupByLibrary.simpleMessage(
            "Twoja wiadomość została wysłana pomyślnie!")
      };
}
