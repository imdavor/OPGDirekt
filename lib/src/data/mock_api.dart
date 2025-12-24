import 'dart:async';

import '../models/models.dart';

/// Lightweight in-memory mock to unblock UI work before backend is ready.
class MockApi {
  MockApi();

  final List<Vendor> _vendors = [
    Vendor(
      id: 'v-1',
      name: 'OPG Novak',
      description: 'Povrće i voće iz okolice.',
      tags: const ['povrće', 'voće'],
      location: const GeoPoint(lat: 45.8150, lng: 15.9819, label: 'Zagreb centar'),
      delivery: const DeliveryOptions(radiusKm: 5, pickupAllowed: true, deliveryAllowed: true, deliveryFee: 3.0),
      schedule: const [
        OpenInterval(day: 'Mon-Fri', open: '08:00', close: '16:00'),
        OpenInterval(day: 'Sat', open: '08:00', close: '12:00'),
      ],
      averagePrepMinutes: 30,
      isActive: true,
    ),
    Vendor(
      id: 'v-2',
      name: 'OPG Kovač',
      description: 'Domaći sirevi i jaja.',
      tags: const ['sir', 'jaja'],
      location: const GeoPoint(lat: 45.84, lng: 16.0, label: 'Maksimir'),
      delivery: const DeliveryOptions(radiusKm: 8, pickupAllowed: true, deliveryAllowed: true, deliveryFee: 4.5, minimumOrder: 10),
      schedule: const [OpenInterval(day: 'Mon-Sat', open: '09:00', close: '17:00')],
      averagePrepMinutes: 20,
      isActive: true,
    ),
  ];

  final List<Product> _products = [
    Product(
      id: 'p-apple',
      vendorId: 'v-1',
      name: 'Jabuke (kg)',
      price: 2.8,
      tags: const ['voće', 'sezonsko'],
    ),
    Product(
      id: 'p-carrot',
      vendorId: 'v-1',
      name: 'Mrkva (kg)',
      price: 1.9,
      tags: const ['povrće'],
    ),
    Product(
      id: 'p-cheese',
      vendorId: 'v-2',
      name: 'Sir domaći (500g)',
      price: 6.5,
      tags: const ['sir'],
    ),
    Product(
      id: 'p-eggs',
      vendorId: 'v-2',
      name: 'Jaja (10 kom)',
      price: 3.2,
      tags: const ['jaja'],
    ),
  ];

  Future<List<Vendor>> fetchVendors() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _vendors;
  }

  Future<List<Product>> fetchProductsByVendor(String vendorId) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return _products.where((p) => p.vendorId == vendorId).toList();
  }

  Future<Order> createOrder({
    required String vendorId,
    required String customerId,
    required List<OrderItem> items,
    FulfillmentType fulfillment = FulfillmentType.pickup,
    GeoPoint? deliveryLocation,
    String? note,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final total = items.fold<double>(0, (sum, item) => sum + item.lineTotal);
    return Order(
      id: 'ord-${DateTime.now().millisecondsSinceEpoch}',
      vendorId: vendorId,
      customerId: customerId,
      items: items,
      status: OrderStatus.pending,
      fulfillment: fulfillment,
      deliveryLocation: deliveryLocation,
      customerNote: note,
      total: total,
      placedAt: DateTime.now(),
    );
  }
}
