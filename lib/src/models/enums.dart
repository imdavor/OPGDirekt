import 'package:json_annotation/json_annotation.dart';

part 'enums.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserRole {
  consumer,
  vendor,
}

@JsonEnum(alwaysCreate: true)
enum OrderStatus {
  draft,
  pending,
  accepted,
  preparing,
  ready,
  outForDelivery,
  completed,
  cancelled,
}

@JsonEnum(alwaysCreate: true)
enum FulfillmentType {
  pickup,
  delivery,
}
