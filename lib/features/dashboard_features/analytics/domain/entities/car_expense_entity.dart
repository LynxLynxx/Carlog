import 'package:carlog/core/converters/timestamp_converter.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_expense_entity.freezed.dart';
part 'car_expense_entity.g.dart';

@freezed
class CarExpenseEntity with _$CarExpenseEntity {
  factory CarExpenseEntity({
    required String carExpenseId,
    @TimestampConverter() DateTime? timestamp,
    @TimestampConverter() DateTime? createTimestamp,
    @Default(null) num? amount,
    @Default(null) String? currency,
    @Default(null) num? milage,
    @Default(null) String? note,
    @Default(null) String? attachmentPath,
    @Default(null) CarExpenseEnum? expense,
    @Default(false) bool isDeleted,
  }) = _CarExpenseEntity;

  factory CarExpenseEntity.fromJson(Map<String, dynamic> json) =>
      _$CarExpenseEntityFromJson(json);
}
