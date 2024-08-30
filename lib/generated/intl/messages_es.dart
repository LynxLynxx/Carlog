// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(language) => "${Intl.select(language, {
            'pl': 'Polaco',
            'en': 'Inglés',
            'other': 'Español',
          })}";

  static String m1(theme) => "${Intl.select(theme, {
            'light': 'claro',
            'other': 'oscuro',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("CUENTA"),
        "addAction": MessageLookupByLibrary.simpleMessage("Agregar acción"),
        "addCar": MessageLookupByLibrary.simpleMessage("Añadir coche"),
        "address": MessageLookupByLibrary.simpleMessage("Dirección"),
        "addressValidator": MessageLookupByLibrary.simpleMessage(
            "La dirección debe tener entre 1 y 100 caracteres"),
        "analytics": MessageLookupByLibrary.simpleMessage("Análisis"),
        "bodyAnalyticsTutorial": MessageLookupByLibrary.simpleMessage(
            "¡Accede a una vista previa de las estadísticas de gastos de tu coche!"),
        "bodyElectricCarsTutorial": MessageLookupByLibrary.simpleMessage(
            "¿Tienes un coche eléctrico? ¡También los apoyamos!"),
        "bodyReciveNotifications": MessageLookupByLibrary.simpleMessage(
            "¡Recibe notificaciones sobre los próximos servicios y reparaciones programadas!"),
        "carBrand": MessageLookupByLibrary.simpleMessage("Marca del coche"),
        "carBrandValidator": MessageLookupByLibrary.simpleMessage(
            "El nombre de la marca del vehículo debe tener entre 2 y 20 caracteres"),
        "carModel": MessageLookupByLibrary.simpleMessage("Modelo del coche"),
        "carModelValidator": MessageLookupByLibrary.simpleMessage(
            "El nombre del modelo del vehículo debe tener entre 1 y 30 caracteres"),
        "carPlateValidator": MessageLookupByLibrary.simpleMessage(
            "La matrícula del vehículo debe tener entre 1 y 15 caracteres"),
        "carYearValidator": MessageLookupByLibrary.simpleMessage(
            "El año de fabricación del vehículo debe tener 4 caracteres"),
        "cars": MessageLookupByLibrary.simpleMessage("Coches"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Cambiar contraseña"),
        "colorTheme": MessageLookupByLibrary.simpleMessage("Tema de color"),
        "congratulations":
            MessageLookupByLibrary.simpleMessage("¡Felicidades!"),
        "coordinatesValidator": MessageLookupByLibrary.simpleMessage(
            "Las coordenadas deben tener entre 1 y 25 caracteres"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("¡Crea una cuenta!"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Contraseña actual"),
        "customize": MessageLookupByLibrary.simpleMessage("PERSONALIZAR"),
        "date": MessageLookupByLibrary.simpleMessage("Fecha"),
        "deleteVehicleConfirmation": MessageLookupByLibrary.simpleMessage(
            "¿Está seguro de que desea eliminar este vehículo?"),
        "eg10000": MessageLookupByLibrary.simpleMessage("p. ej. 10 000"),
        "eg163": MessageLookupByLibrary.simpleMessage("p. ej. 163"),
        "eg1984": MessageLookupByLibrary.simpleMessage("p. ej. 1984"),
        "eg2024": MessageLookupByLibrary.simpleMessage("p. ej. 2024"),
        "eg20240101": MessageLookupByLibrary.simpleMessage("p. ej. 2024-01-01"),
        "egAUM550": MessageLookupByLibrary.simpleMessage("p. ej. AUM 550"),
        "egHybrid": MessageLookupByLibrary.simpleMessage("p. ej. Híbrido"),
        "egRememberToChangeTheOil": MessageLookupByLibrary.simpleMessage(
            "Ejemplo: Recuerda cambiar el aceite."),
        "egSUV": MessageLookupByLibrary.simpleMessage("p. ej. SUV"),
        "egService": MessageLookupByLibrary.simpleMessage("p. ej. Servicio"),
        "egVolvo": MessageLookupByLibrary.simpleMessage("p. ej. Volvo"),
        "egWalkway": MessageLookupByLibrary.simpleMessage(
            "p. ej. Pasarela, 10004, NY, Estados Unidos"),
        "egXC90": MessageLookupByLibrary.simpleMessage("p. ej. XC90"),
        "electricCars":
            MessageLookupByLibrary.simpleMessage("Coches eléctricos"),
        "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "engineCapacity":
            MessageLookupByLibrary.simpleMessage("Cilindrada del motor"),
        "engineCapacityValidator": MessageLookupByLibrary.simpleMessage(
            "La cilindrada del motor debe tener entre 1 y 7 dígitos"),
        "enginePower":
            MessageLookupByLibrary.simpleMessage("Potencia del motor"),
        "enginePowerValidator": MessageLookupByLibrary.simpleMessage(
            "La potencia del motor debe tener entre 1 y 4 dígitos"),
        "enterItManually":
            MessageLookupByLibrary.simpleMessage("¡Introdúzcalo manualmente!"),
        "errorAborted": MessageLookupByLibrary.simpleMessage(
            "La operación se ha cancelado."),
        "errorAccountExists": MessageLookupByLibrary.simpleMessage(
            "Ya existe una cuenta con diferentes credenciales."),
        "errorAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Estos datos ya existen."),
        "errorCancled": MessageLookupByLibrary.simpleMessage(
            "La operación se ha cancelado."),
        "errorDataLoss": MessageLookupByLibrary.simpleMessage(
            "Tus datos se han perdido o corrompido."),
        "errorDeadlineExceeded": MessageLookupByLibrary.simpleMessage(
            "No se ha podido completar la operación."),
        "errorEmailInUse":
            MessageLookupByLibrary.simpleMessage("La cuenta ya existe."),
        "errorFailedPrecondition": MessageLookupByLibrary.simpleMessage(
            "La operación se ha rechazado porque el sistema no ha podido continuar con la ejecución."),
        "errorInternal": MessageLookupByLibrary.simpleMessage(
            "Se ha producido un error interno. Por favor, inténtalo de nuevo más tarde."),
        "errorInvalidArgument": MessageLookupByLibrary.simpleMessage(
            "Se ha especificado un argumento no válido."),
        "errorInvalidCerificationId": MessageLookupByLibrary.simpleMessage(
            "El ID de verificación no es válido."),
        "errorInvalidCredential": MessageLookupByLibrary.simpleMessage(
            "Las credenciales recibidas no son válidas."),
        "errorInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "El correo electrónico no es válido o está mal formateado."),
        "errorInvalidVerificationCode": MessageLookupByLibrary.simpleMessage(
            "El código de verificación no es válido."),
        "errorNotFound": MessageLookupByLibrary.simpleMessage(
            "El documento solicitado no se ha encontrado."),
        "errorOperationNotAllowed": MessageLookupByLibrary.simpleMessage(
            "La operación no está permitida. Por favor, contacta con el soporte técnico."),
        "errorOutOfRange": MessageLookupByLibrary.simpleMessage(
            "Se ha intentado realizar una operación fuera del rango válido."),
        "errorResourceExhausted": MessageLookupByLibrary.simpleMessage(
            "Los recursos no están disponibles en este momento. Inténtalo de nuevo más tarde."),
        "errorUnauthenticated": MessageLookupByLibrary.simpleMessage(
            "No tienes permiso para realizar esta operación."),
        "errorUnavailable": MessageLookupByLibrary.simpleMessage(
            "El servicio no está disponible actualmente."),
        "errorUnimplemented": MessageLookupByLibrary.simpleMessage(
            "La operación no está implementada o no es compatible."),
        "errorUnknown": MessageLookupByLibrary.simpleMessage(
            "Se ha producido un error desconocido."),
        "errorUserDisabled": MessageLookupByLibrary.simpleMessage(
            "El usuario se ha desactivado. Por favor, contacta con el soporte técnico para obtener ayuda."),
        "errorUserNotFound": MessageLookupByLibrary.simpleMessage(
            "No existe un usuario con estas credenciales."),
        "errorWeakPassword": MessageLookupByLibrary.simpleMessage(
            "Por favor, introduce una contraseña más segura."),
        "feedback": MessageLookupByLibrary.simpleMessage("RETROALIMENTACIÓN"),
        "fuelType": MessageLookupByLibrary.simpleMessage("Tipo de combustible"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Empezar"),
        "information": MessageLookupByLibrary.simpleMessage("Información"),
        "language": MessageLookupByLibrary.simpleMessage("Idioma"),
        "lastName": MessageLookupByLibrary.simpleMessage("Apellido"),
        "legalInformation":
            MessageLookupByLibrary.simpleMessage("INFORMACIÓN LEGAL"),
        "library": MessageLookupByLibrary.simpleMessage("Biblioteca"),
        "litersValidator": MessageLookupByLibrary.simpleMessage(
            "Los litros deben tener entre 1 y 4 dígitos"),
        "logOut": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "manageActions":
            MessageLookupByLibrary.simpleMessage("Administrar acciones"),
        "milage": MessageLookupByLibrary.simpleMessage("Kilometraje"),
        "milageValidator": MessageLookupByLibrary.simpleMessage(
            "El kilometraje debe tener entre 1 y 8 dígitos"),
        "myAccount": MessageLookupByLibrary.simpleMessage("Mi cuenta"),
        "name": MessageLookupByLibrary.simpleMessage("Nombre"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Nueva contraseña"),
        "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
        "notValidEmpty": MessageLookupByLibrary.simpleMessage(
            "El campo no puede estar vacío"),
        "note": MessageLookupByLibrary.simpleMessage("Nota"),
        "noteValidator": MessageLookupByLibrary.simpleMessage(
            "La nota debe tener entre 2 y 100 caracteres."),
        "notifications": MessageLookupByLibrary.simpleMessage("Notificaciones"),
        "or": MessageLookupByLibrary.simpleMessage("O"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "passwordRecovery":
            MessageLookupByLibrary.simpleMessage("Recuperación de contraseña"),
        "permissions": MessageLookupByLibrary.simpleMessage("PERMISOS"),
        "plate": MessageLookupByLibrary.simpleMessage("Matrícula"),
        "pricePerLiterValidator": MessageLookupByLibrary.simpleMessage(
            "El precio debe tener entre 1 y 8 dígitos"),
        "priceValidator": MessageLookupByLibrary.simpleMessage(
            "El precio debe tener entre 1 y 5 dígitos"),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "pushNotifications":
            MessageLookupByLibrary.simpleMessage("Notificaciones push"),
        "regionCountry": MessageLookupByLibrary.simpleMessage("Región/País"),
        "register": MessageLookupByLibrary.simpleMessage("Registrarse"),
        "remindPassword":
            MessageLookupByLibrary.simpleMessage("Recordar contraseña"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repetir la nueva contraseña"),
        "reportProblem":
            MessageLookupByLibrary.simpleMessage("Reportar problema"),
        "requestNewFeature":
            MessageLookupByLibrary.simpleMessage("Solicitar nueva función"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "settings": MessageLookupByLibrary.simpleMessage("Configuración"),
        "skip": MessageLookupByLibrary.simpleMessage("Omitir"),
        "successfullyAddedTheActivity": MessageLookupByLibrary.simpleMessage(
            "Actividad agregada correctamente"),
        "successfullyAddedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Vehículo añadido correctamente"),
        "successfullyDeletedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Vehículo eliminado correctamente"),
        "successfullyEditedTheVehicle": MessageLookupByLibrary.simpleMessage(
            "Vehículo editado correctamente"),
        "successfullyUpdatedTheMilage": MessageLookupByLibrary.simpleMessage(
            "Kilometraje actualizado correctamente"),
        "supportedLanguage": m0,
        "supportedThemes": m1,
        "tapOnTheMap": MessageLookupByLibrary.simpleMessage(
            "Toca en el mapa para establecer la ubicación de la acción."),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("Términos de uso"),
        "today": MessageLookupByLibrary.simpleMessage("Hoy"),
        "type": MessageLookupByLibrary.simpleMessage("Tipo"),
        "unableToLocateYourBrand":
            MessageLookupByLibrary.simpleMessage("¿No encuentra su marca?"),
        "unableToLocateYourModel":
            MessageLookupByLibrary.simpleMessage("¿No encuentra su modelo?"),
        "updateCar": MessageLookupByLibrary.simpleMessage("Actualizar coche"),
        "updateMilage":
            MessageLookupByLibrary.simpleMessage("Actualizar kilometraje"),
        "welocomeBack":
            MessageLookupByLibrary.simpleMessage("¡Bienvenido de nuevo!"),
        "yearOfProduction":
            MessageLookupByLibrary.simpleMessage("Año de producción"),
        "youDontHaveAnPlannedActivity": MessageLookupByLibrary.simpleMessage(
            "Todavía no tienes una actividad planificada."),
        "youHaveNoCarsYet": MessageLookupByLibrary.simpleMessage(
            "Aún no tienes autos, ¡agrega uno!"),
        "youHaveSuccessfullyCreatedYourCar":
            MessageLookupByLibrary.simpleMessage(
                "¡Ha creado su coche con éxito!")
      };
}
