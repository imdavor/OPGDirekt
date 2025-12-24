import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'product.dart';
import 'value_objects.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required String name,
    required double unitPrice,
    required int quantity,
    String? currency,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  const OrderItem._();

  double get lineTotal => unitPrice * quantity;
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String vendorId,
    required String customerId,
    @Default(<OrderItem>[]) List<OrderItem> items,
    @Default(OrderStatus.draft) OrderStatus status,
    FulfillmentType? fulfillment,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) GeoPoint? deliveryLocation,
    String? pickupNote,
    String? customerNote,
    double? deliveryFee,
    double? total,
    DateTime? placedAt,
    DateTime? updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

GeoPoint? _geoFromJson(Map<String, dynamic>? json) =>
    json == null ? null : GeoPoint.fromJson(json);

Map<String, dynamic>? _geoToJson(GeoPoint? value) => value?.toJson();
