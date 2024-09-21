import 'package:carlog/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PaddingsK extends Constants {
  //SECTION - [PADDINGS]

  //ANCHOR - [ALL]
  static const all4 = EdgeInsets.all(4.0);
  static const all8 = EdgeInsets.all(8.0);
  static const all12 = EdgeInsets.all(12.0);
  static const all16 = EdgeInsets.all(16.0);
  static const all24 = EdgeInsets.all(16.0);

  //ANCHOR - [HORIZONTAL]
  static const h10 = EdgeInsets.symmetric(horizontal: 10.0);
  static const h20 = EdgeInsets.symmetric(horizontal: 20.0);
  static const h30 = EdgeInsets.symmetric(horizontal: 30.0);
  static const h50 = EdgeInsets.symmetric(horizontal: 50.0);

  //ANCHOR - [VERTICAL]
  static const v5 = EdgeInsets.symmetric(vertical: 5.0);
  static const v10 = EdgeInsets.symmetric(vertical: 10.0);
  static const v20 = EdgeInsets.symmetric(vertical: 20.0);

  //ANCHOR - [HORIZONTAL/VERTICAL]
  static const h20v10 = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const h30v10 = EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0);
  static const h30v15 = EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0);

  //ANCHOR - [ONLY]
  static const b25 = EdgeInsets.only(bottom: 25);
  static const l30r30top10b30 =
      EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 30.0);

  //!SECTION

  //SECTION - [BORDER RADIUS]

  static BorderRadius circular5 = BorderRadius.circular(5.0);
  static BorderRadius circular10 = BorderRadius.circular(10.0);
  static BorderRadius circular20 = BorderRadius.circular(20.0);
  static BorderRadius circular30 = BorderRadius.circular(30.0);

  //!SECTION
}
