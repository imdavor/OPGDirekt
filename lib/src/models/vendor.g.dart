// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  location: _geoFromJson(json['location'] as Map<String, dynamic>?),
  address: json['address'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  delivery: json['delivery'] == null
      ? null
      : DeliveryOptions.fromJson(json['delivery'] as Map<String, dynamic>),
  schedule:
      (json['schedule'] as List<dynamic>?)
          ?.map((e) => OpenInterval.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OpenInterval>[],
  averagePrepMinutes: (json['averagePrepMinutes'] as num?)?.toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  isActive: json['isActive'] as bool?,
);

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': _geoToJson(instance.location),
      'address': instance.address,
      'tags': instance.tags,
      'delivery': instance.delivery,
      'schedule': instance.schedule,
      'averagePrepMinutes': instance.averagePrepMinutes,
      'rating': instance.rating,
      'isActive': instance.isActive,
    };
