// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) {
  return _GeoPoint.fromJson(json);
}

/// @nodoc
mixin _$GeoPoint {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this GeoPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoPointCopyWith<GeoPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPointCopyWith<$Res> {
  factory $GeoPointCopyWith(GeoPoint value, $Res Function(GeoPoint) then) =
      _$GeoPointCopyWithImpl<$Res, GeoPoint>;
  @useResult
  $Res call({double lat, double lng, String? label});
}

/// @nodoc
class _$GeoPointCopyWithImpl<$Res, $Val extends GeoPoint>
    implements $GeoPointCopyWith<$Res> {
  _$GeoPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null, Object? label = freezed}) {
    return _then(
      _value.copyWith(
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeoPointImplCopyWith<$Res>
    implements $GeoPointCopyWith<$Res> {
  factory _$$GeoPointImplCopyWith(
    _$GeoPointImpl value,
    $Res Function(_$GeoPointImpl) then,
  ) = __$$GeoPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng, String? label});
}

/// @nodoc
class __$$GeoPointImplCopyWithImpl<$Res>
    extends _$GeoPointCopyWithImpl<$Res, _$GeoPointImpl>
    implements _$$GeoPointImplCopyWith<$Res> {
  __$$GeoPointImplCopyWithImpl(
    _$GeoPointImpl _value,
    $Res Function(_$GeoPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null, Object? label = freezed}) {
    return _then(
      _$GeoPointImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoPointImpl implements _GeoPoint {
  const _$GeoPointImpl({required this.lat, required this.lng, this.label});

  factory _$GeoPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoPointImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String? label;

  @override
  String toString() {
    return 'GeoPoint(lat: $lat, lng: $lng, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoPointImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, label);

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      __$$GeoPointImplCopyWithImpl<_$GeoPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoPointImplToJson(this);
  }
}

abstract class _GeoPoint implements GeoPoint {
  const factory _GeoPoint({
    required final double lat,
    required final double lng,
    final String? label,
  }) = _$GeoPointImpl;

  factory _GeoPoint.fromJson(Map<String, dynamic> json) =
      _$GeoPointImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String? get label;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryOptions _$DeliveryOptionsFromJson(Map<String, dynamic> json) {
  return _DeliveryOptions.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOptions {
  double? get radiusKm => throw _privateConstructorUsedError;
  bool get pickupAllowed => throw _privateConstructorUsedError;
  bool get deliveryAllowed => throw _privateConstructorUsedError;
  double? get deliveryFee => throw _privateConstructorUsedError;
  double? get minimumOrder => throw _privateConstructorUsedError;

  /// Serializes this DeliveryOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryOptionsCopyWith<DeliveryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOptionsCopyWith<$Res> {
  factory $DeliveryOptionsCopyWith(
    DeliveryOptions value,
    $Res Function(DeliveryOptions) then,
  ) = _$DeliveryOptionsCopyWithImpl<$Res, DeliveryOptions>;
  @useResult
  $Res call({
    double? radiusKm,
    bool pickupAllowed,
    bool deliveryAllowed,
    double? deliveryFee,
    double? minimumOrder,
  });
}

/// @nodoc
class _$DeliveryOptionsCopyWithImpl<$Res, $Val extends DeliveryOptions>
    implements $DeliveryOptionsCopyWith<$Res> {
  _$DeliveryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radiusKm = freezed,
    Object? pickupAllowed = null,
    Object? deliveryAllowed = null,
    Object? deliveryFee = freezed,
    Object? minimumOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            radiusKm: freezed == radiusKm
                ? _value.radiusKm
                : radiusKm // ignore: cast_nullable_to_non_nullable
                      as double?,
            pickupAllowed: null == pickupAllowed
                ? _value.pickupAllowed
                : pickupAllowed // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryAllowed: null == deliveryAllowed
                ? _value.deliveryAllowed
                : deliveryAllowed // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryFee: freezed == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            minimumOrder: freezed == minimumOrder
                ? _value.minimumOrder
                : minimumOrder // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryOptionsImplCopyWith<$Res>
    implements $DeliveryOptionsCopyWith<$Res> {
  factory _$$DeliveryOptionsImplCopyWith(
    _$DeliveryOptionsImpl value,
    $Res Function(_$DeliveryOptionsImpl) then,
  ) = __$$DeliveryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? radiusKm,
    bool pickupAllowed,
    bool deliveryAllowed,
    double? deliveryFee,
    double? minimumOrder,
  });
}

/// @nodoc
class __$$DeliveryOptionsImplCopyWithImpl<$Res>
    extends _$DeliveryOptionsCopyWithImpl<$Res, _$DeliveryOptionsImpl>
    implements _$$DeliveryOptionsImplCopyWith<$Res> {
  __$$DeliveryOptionsImplCopyWithImpl(
    _$DeliveryOptionsImpl _value,
    $Res Function(_$DeliveryOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radiusKm = freezed,
    Object? pickupAllowed = null,
    Object? deliveryAllowed = null,
    Object? deliveryFee = freezed,
    Object? minimumOrder = freezed,
  }) {
    return _then(
      _$DeliveryOptionsImpl(
        radiusKm: freezed == radiusKm
            ? _value.radiusKm
            : radiusKm // ignore: cast_nullable_to_non_nullable
                  as double?,
        pickupAllowed: null == pickupAllowed
            ? _value.pickupAllowed
            : pickupAllowed // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryAllowed: null == deliveryAllowed
            ? _value.deliveryAllowed
            : deliveryAllowed // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryFee: freezed == deliveryFee
            ? _value.deliveryFee
            : deliveryFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        minimumOrder: freezed == minimumOrder
            ? _value.minimumOrder
            : minimumOrder // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryOptionsImpl implements _DeliveryOptions {
  const _$DeliveryOptionsImpl({
    this.radiusKm,
    this.pickupAllowed = true,
    this.deliveryAllowed = false,
    this.deliveryFee,
    this.minimumOrder,
  });

  factory _$DeliveryOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryOptionsImplFromJson(json);

  @override
  final double? radiusKm;
  @override
  @JsonKey()
  final bool pickupAllowed;
  @override
  @JsonKey()
  final bool deliveryAllowed;
  @override
  final double? deliveryFee;
  @override
  final double? minimumOrder;

  @override
  String toString() {
    return 'DeliveryOptions(radiusKm: $radiusKm, pickupAllowed: $pickupAllowed, deliveryAllowed: $deliveryAllowed, deliveryFee: $deliveryFee, minimumOrder: $minimumOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryOptionsImpl &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm) &&
            (identical(other.pickupAllowed, pickupAllowed) ||
                other.pickupAllowed == pickupAllowed) &&
            (identical(other.deliveryAllowed, deliveryAllowed) ||
                other.deliveryAllowed == deliveryAllowed) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.minimumOrder, minimumOrder) ||
                other.minimumOrder == minimumOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    radiusKm,
    pickupAllowed,
    deliveryAllowed,
    deliveryFee,
    minimumOrder,
  );

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryOptionsImplCopyWith<_$DeliveryOptionsImpl> get copyWith =>
      __$$DeliveryOptionsImplCopyWithImpl<_$DeliveryOptionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryOptionsImplToJson(this);
  }
}

abstract class _DeliveryOptions implements DeliveryOptions {
  const factory _DeliveryOptions({
    final double? radiusKm,
    final bool pickupAllowed,
    final bool deliveryAllowed,
    final double? deliveryFee,
    final double? minimumOrder,
  }) = _$DeliveryOptionsImpl;

  factory _DeliveryOptions.fromJson(Map<String, dynamic> json) =
      _$DeliveryOptionsImpl.fromJson;

  @override
  double? get radiusKm;
  @override
  bool get pickupAllowed;
  @override
  bool get deliveryAllowed;
  @override
  double? get deliveryFee;
  @override
  double? get minimumOrder;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryOptionsImplCopyWith<_$DeliveryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenInterval _$OpenIntervalFromJson(Map<String, dynamic> json) {
  return _OpenInterval.fromJson(json);
}

/// @nodoc
mixin _$OpenInterval {
  String get day => throw _privateConstructorUsedError; // e.g. Mon, Tue
  String get open => throw _privateConstructorUsedError; // HH:mm
  String get close => throw _privateConstructorUsedError;

  /// Serializes this OpenInterval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenIntervalCopyWith<OpenInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenIntervalCopyWith<$Res> {
  factory $OpenIntervalCopyWith(
    OpenInterval value,
    $Res Function(OpenInterval) then,
  ) = _$OpenIntervalCopyWithImpl<$Res, OpenInterval>;
  @useResult
  $Res call({String day, String open, String close});
}

/// @nodoc
class _$OpenIntervalCopyWithImpl<$Res, $Val extends OpenInterval>
    implements $OpenIntervalCopyWith<$Res> {
  _$OpenIntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? day = null, Object? open = null, Object? close = null}) {
    return _then(
      _value.copyWith(
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String,
            open: null == open
                ? _value.open
                : open // ignore: cast_nullable_to_non_nullable
                      as String,
            close: null == close
                ? _value.close
                : close // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenIntervalImplCopyWith<$Res>
    implements $OpenIntervalCopyWith<$Res> {
  factory _$$OpenIntervalImplCopyWith(
    _$OpenIntervalImpl value,
    $Res Function(_$OpenIntervalImpl) then,
  ) = __$$OpenIntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, String open, String close});
}

/// @nodoc
class __$$OpenIntervalImplCopyWithImpl<$Res>
    extends _$OpenIntervalCopyWithImpl<$Res, _$OpenIntervalImpl>
    implements _$$OpenIntervalImplCopyWith<$Res> {
  __$$OpenIntervalImplCopyWithImpl(
    _$OpenIntervalImpl _value,
    $Res Function(_$OpenIntervalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? day = null, Object? open = null, Object? close = null}) {
    return _then(
      _$OpenIntervalImpl(
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String,
        open: null == open
            ? _value.open
            : open // ignore: cast_nullable_to_non_nullable
                  as String,
        close: null == close
            ? _value.close
            : close // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenIntervalImpl implements _OpenInterval {
  const _$OpenIntervalImpl({
    required this.day,
    required this.open,
    required this.close,
  });

  factory _$OpenIntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenIntervalImplFromJson(json);

  @override
  final String day;
  // e.g. Mon, Tue
  @override
  final String open;
  // HH:mm
  @override
  final String close;

  @override
  String toString() {
    return 'OpenInterval(day: $day, open: $open, close: $close)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenIntervalImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, open, close);

  /// Create a copy of OpenInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenIntervalImplCopyWith<_$OpenIntervalImpl> get copyWith =>
      __$$OpenIntervalImplCopyWithImpl<_$OpenIntervalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenIntervalImplToJson(this);
  }
}

abstract class _OpenInterval implements OpenInterval {
  const factory _OpenInterval({
    required final String day,
    required final String open,
    required final String close,
  }) = _$OpenIntervalImpl;

  factory _OpenInterval.fromJson(Map<String, dynamic> json) =
      _$OpenIntervalImpl.fromJson;

  @override
  String get day; // e.g. Mon, Tue
  @override
  String get open; // HH:mm
  @override
  String get close;

  /// Create a copy of OpenInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenIntervalImplCopyWith<_$OpenIntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
