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
  static const addCar = "$cars/addCar";
  static const complexManageCar = "$cars/complexManageCar";
  static const statistics = "/statistics";
  static const profile = "/profile";

  //SECTION - [ERRORS]
  static const unknownError = "/unknownError";
  static const connectionLostError = "/connectionLost";
}
