import 'package:carlog/core/router/entities/route_entity.dart';

class RoutesK {
  //SECTION - [HELPERS]
  static const loading = "/loading";
  static const webview = "/webview";
  //!SECTION

  //SECTION - [AUTH]
  static const login = "/login";
  static const register = "/register";
  static const recoveryPassword = "/recoveryPassword";
  static const linkSent = "/linkSent";
  static const tutorial = "/tutorial";
  //!SECTION

  static const home = "/";
  static const addMilage = "/addMilage";
  static const cars = "/cars";
  static const addCar =
      RouteEntity(relativePath: "addCar", fullPath: "$cars/addCar");
  static const addAction = "/addAction";
  static const addExpense = "/addExpense";
  static const map = "/addAction/map";
  static const mapInfo = "/addAction/map/mapInfo";
  static const manageCar =
      RouteEntity(relativePath: "manageCar", fullPath: "$cars/manageCar");
  static const deleteCarConfirmation = RouteEntity(
      relativePath: "deleteCarConfirmation",
      fullPath: "$cars/manageCar/deleteCarConfirmation");
  static const statistics = "/statistics";

  //SECTION - [ERRORS]
  static const unknownError = "/unknownError";
  static const connectionLostError = "/connectionLost";
  //!SECTION

  //SECTION - [SETTINGS]
  static const settings = "/settings";
  static const myAccount =
      RouteEntity(relativePath: "myAccount", fullPath: "$settings/myAccount");
  static const changePassword = RouteEntity(
      relativePath: "changePassword", fullPath: "$settings/changePassword");

  static const aboutApp =
      RouteEntity(relativePath: "aboutApp", fullPath: "$settings/aboutApp");
  static const requestFeature = RouteEntity(
      relativePath: "requestFeature", fullPath: "$settings/requestFeature");

  static const List<String> shellBranchesNames = [
    RoutesK.home,
    RoutesK.cars,
    RoutesK.statistics,
    RoutesK.settings,
  ];
}
