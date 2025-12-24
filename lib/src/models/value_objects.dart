import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_objects.freezed.dart';
part 'value_objects.g.dart';

@freezed
class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required double lat,
    required double lng,
    String? label,
  }) = _GeoPoint;

  factory GeoPoint.fromJson(Map<String, dynamic> json) => _$GeoPointFromJson(json);
}

@freezed
class DeliveryOptions with _$DeliveryOptions {
  const factory DeliveryOptions({
    double? radiusKm,
    @Default(true) bool pickupAllowed,
    @Default(false) bool deliveryAllowed,
    double? deliveryFee,
    double? minimumOrder,
  }) = _DeliveryOptions;

  factory DeliveryOptions.fromJson(Map<String, dynamic> json) => _$DeliveryOptionsFromJson(json);
}

@freezed
class OpenInterval with _$OpenInterval {
  const factory OpenInterval({
    required String day, // e.g. Mon, Tue
    required String open, // HH:mm
    required String close, // HH:mm
  }) = _OpenInterval;

  factory OpenInterval.fromJson(Map<String, dynamic> json) => _$OpenIntervalFromJson(json);
}
