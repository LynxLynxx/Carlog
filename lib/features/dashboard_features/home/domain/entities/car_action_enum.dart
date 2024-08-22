enum CarActionEnum {
  service,
  oilChange,
  tireChange,
  insurance,
}

extension CarActionEnumExtension on CarActionEnum {
  static String getCustomName(CarActionEnum? carActionEnum) {
    switch (carActionEnum) {
      case CarActionEnum.service:
        return "Service";
      case CarActionEnum.oilChange:
        return "Oil Change";
      case CarActionEnum.tireChange:
        return "Tire Change";
      case CarActionEnum.insurance:
        return "Insurance";
      default:
        return "Service";
    }
  }
}
