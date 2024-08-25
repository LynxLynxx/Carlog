import 'package:carlog/generated/l10n.dart';

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
        return S.current.service;
      case CarActionEnum.oilChange:
        return S.current.oilChange;
      case CarActionEnum.tireChange:
        return S.current.tireChange;
      case CarActionEnum.insurance:
        return S.current.insurance;
      default:
        return S.current.service;
    }
  }
}
