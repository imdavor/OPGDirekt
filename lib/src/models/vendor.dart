import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'value_objects.dart';

part 'vendor.freezed.dart';
part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor {
  const factory Vendor({
    required String id,
    required String name,
    String? description,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) GeoPoint? location,
    String? address,
    @Default(<String>[]) List<String> tags,
    DeliveryOptions? delivery,
    @Default(<OpenInterval>[]) List<OpenInterval> schedule,
    double? averagePrepMinutes,
    double? rating,
    bool? isActive,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

GeoPoint? _geoFromJson(Map<String, dynamic>? json) =>
    json == null ? null : GeoPoint.fromJson(json);

Map<String, dynamic>? _geoToJson(GeoPoint? value) => value?.toJson();
