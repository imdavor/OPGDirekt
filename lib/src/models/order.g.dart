// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      productId: json['productId'] as String,
      name: json['name'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'currency': instance.currency,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
  id: json['id'] as String,
  vendorId: json['vendorId'] as String,
  customerId: json['customerId'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItem>[],
  status:
      $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
      OrderStatus.draft,
  fulfillment: $enumDecodeNullable(
    _$FulfillmentTypeEnumMap,
    json['fulfillment'],
  ),
  deliveryLocation: _geoFromJson(
    json['deliveryLocation'] as Map<String, dynamic>?,
  ),
  pickupNote: json['pickupNote'] as String?,
  customerNote: json['customerNote'] as String?,
  deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toDouble(),
  placedAt: json['placedAt'] == null
      ? null
      : DateTime.parse(json['placedAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendorId': instance.vendorId,
      'customerId': instance.customerId,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'fulfillment': _$FulfillmentTypeEnumMap[instance.fulfillment],
      'deliveryLocation': _geoToJson(instance.deliveryLocation),
      'pickupNote': instance.pickupNote,
      'customerNote': instance.customerNote,
      'deliveryFee': instance.deliveryFee,
      'total': instance.total,
      'placedAt': instance.placedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.outForDelivery: 'outForDelivery',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};

const _$FulfillmentTypeEnumMap = {
  FulfillmentType.pickup: 'pickup',
  FulfillmentType.delivery: 'delivery',
};
