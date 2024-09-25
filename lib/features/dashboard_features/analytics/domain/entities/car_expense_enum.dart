import 'dart:ui';

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

  static Color getCustomColor(CarExpenseEnum? carExpenseEnum) {
    switch (carExpenseEnum) {
      case CarExpenseEnum.insuranceFee:
        return const Color.fromARGB(255, 198, 47, 39);
      case CarExpenseEnum.serviceFee:
        return const Color(0xff4918a5);
      case CarExpenseEnum.roadFee:
        return const Color(0xffb830a4);
      case CarExpenseEnum.carWash:
        return const Color(0xff967cee);
      case CarExpenseEnum.parkingFee:
        return const Color(0xff52b880);
      case CarExpenseEnum.tires:
        return const Color(0xffb159b9);
      case CarExpenseEnum.tuning:
        return const Color(0xffaa164a);
      case CarExpenseEnum.other:
        return const Color.fromARGB(255, 1, 198, 205);
      default:
        return const Color(0xff01cd74);
    }
  }

  static String getCustomIcon(CarExpenseEnum? carExpenseEnum) {
    switch (carExpenseEnum) {
      case CarExpenseEnum.insuranceFee:
        return "assets/analytics_icons/insuranceFee.png";
      case CarExpenseEnum.serviceFee:
        return "assets/analytics_icons/serviceFee.png";
      case CarExpenseEnum.roadFee:
        return "assets/analytics_icons/roadFee.png";
      case CarExpenseEnum.carWash:
        return "assets/analytics_icons/carWash.png";
      case CarExpenseEnum.parkingFee:
        return "assets/analytics_icons/parkingFee.png";
      case CarExpenseEnum.tires:
        return "assets/analytics_icons/tires.png";
      case CarExpenseEnum.tuning:
        return "assets/analytics_icons/tuning.png";
      case CarExpenseEnum.other:
        return "assets/analytics_icons/other.png";
      default:
        return "assets/analytics_icons/other.png";
    }
  }
}
