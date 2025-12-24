import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'value_objects.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required UserRole role,
    required String name,
    String? email,
    String? phone,
    @JsonKey(fromJson: _geoListFromJson, toJson: _geoListToJson)
    @Default(<GeoPoint>[]) List<GeoPoint> savedLocations,
    String? preferredCurrency,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

List<GeoPoint> _geoListFromJson(List<dynamic>? json) =>
    json?.map((e) => GeoPoint.fromJson(Map<String, dynamic>.from(e))).toList() ??
    const [];

List<Map<String, dynamic>> _geoListToJson(List<GeoPoint> list) =>
    list.map((g) => g.toJson()).toList();
