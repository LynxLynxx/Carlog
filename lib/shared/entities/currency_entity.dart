// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.freezed.dart';
part 'currency_entity.g.dart';

@freezed
class CurrencyEntity with _$CurrencyEntity {
  factory CurrencyEntity({
    required String code,
    required String name,
    required String symbol,
    required String? flag,
    required int number,
    @JsonKey(name: 'decimal_digits') required int decimalDigits,
    @JsonKey(name: 'name_plural') required String namePlural,
    @JsonKey(name: 'decimal_separator') required String decimalSeparator,
    @JsonKey(name: 'thousands_separator') required String thousandsSeparator,
    @JsonKey(name: 'symbol_on_left') required bool symbolOnLeft,
    @JsonKey(name: 'space_between_amount_and_symbol')
    required bool spaceBetweenAmountAndSymbol,
  }) = _CurrencyEntity;

  factory CurrencyEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrencyEntityFromJson(json);
}
