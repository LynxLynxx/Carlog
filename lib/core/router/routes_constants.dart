import 'package:carlog/core/router/entities/route_entity.dart';

class RoutesK {
  //SECTION - [HELPERS]
  static const loading = "/loading";
  //!SECTION

  //SECTION - [AUTH]
  static const login = "/login";
  static const register = "/register";
  static const recoveryPassword = "/recoveryPassword";
  static const linkSent = "/linkSent";
  static const tutorial = "/tutorial";
  //!SECTION

  static const home = "/";
  static const cars = "/cars";
  static const addCar = "/addCar";
  static const manageCar = "$cars/manageCar";
  static const deleteCarConfirmation = "$manageCar/deleteCarConfirmation";
  static const statistics = "/statistics";

  //SECTION - [ERRORS]
  static const unknownError = "/unknownError";
  static const connectionLostError = "/connectionLost";
  //!SECTION

  //SECTION - [SETTINGS]
  static const settings = "/settings";
  static const myAccount =
      RouteEntity(relativePath: "myAccount", fullPath: "$settings/myAccount");
}
