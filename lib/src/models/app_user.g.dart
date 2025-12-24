// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      savedLocations: json['savedLocations'] == null
          ? const <GeoPoint>[]
          : _geoListFromJson(json['savedLocations'] as List?),
      preferredCurrency: json['preferredCurrency'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$UserRoleEnumMap[instance.role]!,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'savedLocations': _geoListToJson(instance.savedLocations),
      'preferredCurrency': instance.preferredCurrency,
    };

const _$UserRoleEnumMap = {
  UserRole.consumer: 'consumer',
  UserRole.vendor: 'vendor',
};
