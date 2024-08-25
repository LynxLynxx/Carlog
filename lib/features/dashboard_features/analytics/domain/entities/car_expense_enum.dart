import 'package:carlog/generated/l10n.dart';

enum CarExpenseEnum {
  insuranceFee,
  serviceFee,
  roadFee,
  carWash,
  parkingFee,
  tires,
  tuning,
  other,
}

extension CarExpenseExtension on CarExpenseEnum {
  static String getCustomName(CarExpenseEnum? carExpenseEnum) {
    switch (carExpenseEnum) {
      case CarExpenseEnum.insuranceFee:
        return S.current.insuranceFee;
      case CarExpenseEnum.serviceFee:
        return S.current.serviceFee;
      case CarExpenseEnum.roadFee:
        return S.current.roadFee;
      case CarExpenseEnum.carWash:
        return S.current.carWash;
      case CarExpenseEnum.parkingFee:
        return S.current.parkingFee;
      case CarExpenseEnum.tires:
        return S.current.tires;
      case CarExpenseEnum.tuning:
        return S.current.tuning;
      case CarExpenseEnum.other:
        return S.current.other;
      default:
        return S.current.other;
    }
  }
}
