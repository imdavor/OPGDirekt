// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  GeoPoint? get location => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DeliveryOptions? get delivery => throw _privateConstructorUsedError;
  List<OpenInterval> get schedule => throw _privateConstructorUsedError;
  double? get averagePrepMinutes => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this Vendor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) GeoPoint? location,
    String? address,
    List<String> tags,
    DeliveryOptions? delivery,
    List<OpenInterval> schedule,
    double? averagePrepMinutes,
    double? rating,
    bool? isActive,
  });

  $GeoPointCopyWith<$Res>? get location;
  $DeliveryOptionsCopyWith<$Res>? get delivery;
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? tags = null,
    Object? delivery = freezed,
    Object? schedule = null,
    Object? averagePrepMinutes = freezed,
    Object? rating = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            delivery: freezed == delivery
                ? _value.delivery
                : delivery // ignore: cast_nullable_to_non_nullable
                      as DeliveryOptions?,
            schedule: null == schedule
                ? _value.schedule
                : schedule // ignore: cast_nullable_to_non_nullable
                      as List<OpenInterval>,
            averagePrepMinutes: freezed == averagePrepMinutes
                ? _value.averagePrepMinutes
                : averagePrepMinutes // ignore: cast_nullable_to_non_nullable
                      as double?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoPointCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsCopyWith<$Res>? get delivery {
    if (_value.delivery == null) {
      return null;
    }

    return $DeliveryOptionsCopyWith<$Res>(_value.delivery!, (value) {
      return _then(_value.copyWith(delivery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorImplCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$VendorImplCopyWith(
    _$VendorImpl value,
    $Res Function(_$VendorImpl) then,
  ) = __$$VendorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) GeoPoint? location,
    String? address,
    List<String> tags,
    DeliveryOptions? delivery,
    List<OpenInterval> schedule,
    double? averagePrepMinutes,
    double? rating,
    bool? isActive,
  });

  @override
  $GeoPointCopyWith<$Res>? get location;
  @override
  $DeliveryOptionsCopyWith<$Res>? get delivery;
}

/// @nodoc
class __$$VendorImplCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$VendorImpl>
    implements _$$VendorImplCopyWith<$Res> {
  __$$VendorImplCopyWithImpl(
    _$VendorImpl _value,
    $Res Function(_$VendorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? tags = null,
    Object? delivery = freezed,
    Object? schedule = null,
    Object? averagePrepMinutes = freezed,
    Object? rating = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _$VendorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        delivery: freezed == delivery
            ? _value.delivery
            : delivery // ignore: cast_nullable_to_non_nullable
                  as DeliveryOptions?,
        schedule: null == schedule
            ? _value._schedule
            : schedule // ignore: cast_nullable_to_non_nullable
                  as List<OpenInterval>,
        averagePrepMinutes: freezed == averagePrepMinutes
            ? _value.averagePrepMinutes
            : averagePrepMinutes // ignore: cast_nullable_to_non_nullable
                  as double?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorImpl implements _Vendor {
  const _$VendorImpl({
    required this.id,
    required this.name,
    this.description,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) this.location,
    this.address,
    final List<String> tags = const <String>[],
    this.delivery,
    final List<OpenInterval> schedule = const <OpenInterval>[],
    this.averagePrepMinutes,
    this.rating,
    this.isActive,
  }) : _tags = tags,
       _schedule = schedule;

  factory _$VendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  final GeoPoint? location;
  @override
  final String? address;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DeliveryOptions? delivery;
  final List<OpenInterval> _schedule;
  @override
  @JsonKey()
  List<OpenInterval> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  final double? averagePrepMinutes;
  @override
  final double? rating;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, description: $description, location: $location, address: $address, tags: $tags, delivery: $delivery, schedule: $schedule, averagePrepMinutes: $averagePrepMinutes, rating: $rating, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.averagePrepMinutes, averagePrepMinutes) ||
                other.averagePrepMinutes == averagePrepMinutes) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    location,
    address,
    const DeepCollectionEquality().hash(_tags),
    delivery,
    const DeepCollectionEquality().hash(_schedule),
    averagePrepMinutes,
    rating,
    isActive,
  );

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      __$$VendorImplCopyWithImpl<_$VendorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorImplToJson(this);
  }
}

abstract class _Vendor implements Vendor {
  const factory _Vendor({
    required final String id,
    required final String name,
    final String? description,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
    final GeoPoint? location,
    final String? address,
    final List<String> tags,
    final DeliveryOptions? delivery,
    final List<OpenInterval> schedule,
    final double? averagePrepMinutes,
    final double? rating,
    final bool? isActive,
  }) = _$VendorImpl;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$VendorImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  GeoPoint? get location;
  @override
  String? get address;
  @override
  List<String> get tags;
  @override
  DeliveryOptions? get delivery;
  @override
  List<OpenInterval> get schedule;
  @override
  double? get averagePrepMinutes;
  @override
  double? get rating;
  @override
  bool? get isActive;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
