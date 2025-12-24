// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoPointImpl _$$GeoPointImplFromJson(Map<String, dynamic> json) =>
    _$GeoPointImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$GeoPointImplToJson(_$GeoPointImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'label': instance.label,
    };

_$DeliveryOptionsImpl _$$DeliveryOptionsImplFromJson(
  Map<String, dynamic> json,
) => _$DeliveryOptionsImpl(
  radiusKm: (json['radiusKm'] as num?)?.toDouble(),
  pickupAllowed: json['pickupAllowed'] as bool? ?? true,
  deliveryAllowed: json['deliveryAllowed'] as bool? ?? false,
  deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
  minimumOrder: (json['minimumOrder'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$DeliveryOptionsImplToJson(
  _$DeliveryOptionsImpl instance,
) => <String, dynamic>{
  'radiusKm': instance.radiusKm,
  'pickupAllowed': instance.pickupAllowed,
  'deliveryAllowed': instance.deliveryAllowed,
  'deliveryFee': instance.deliveryFee,
  'minimumOrder': instance.minimumOrder,
};

_$OpenIntervalImpl _$$OpenIntervalImplFromJson(Map<String, dynamic> json) =>
    _$OpenIntervalImpl(
      day: json['day'] as String,
      open: json['open'] as String,
      close: json['close'] as String,
    );

Map<String, dynamic> _$$OpenIntervalImplToJson(_$OpenIntervalImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'open': instance.open,
      'close': instance.close,
    };
