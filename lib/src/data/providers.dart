import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'mock_api.dart';

final mockApiProvider = Provider<MockApi>((ref) => MockApi());

// --- Auth ---
final authProvider = NotifierProvider<AuthNotifier, AppUser?>(AuthNotifier.new);

class AuthNotifier extends Notifier<AppUser?> {
  @override
  AppUser? build() => null;

  void signIn(UserRole role) {
    state = AppUser(
      id: 'demo-${role.name}',
      role: role,
      name: role == UserRole.vendor ? 'Demo OPG' : 'Demo Kupac',
      email: '${role.name}@demo.local',
    );
  }

  void signOut() => state = null;
}

final vendorsProvider = FutureProvider<List<Vendor>>((ref) async {
  final api = ref.watch(mockApiProvider);
  return api.fetchVendors();
});

final productsByVendorProvider =
    FutureProvider.family<List<Product>, String>((ref, vendorId) async {
  final api = ref.watch(mockApiProvider);
  return api.fetchProductsByVendor(vendorId);
});

final createOrderProvider = FutureProvider.family<Order, CreateOrderPayload>(
  (ref, payload) async {
    final api = ref.watch(mockApiProvider);
    return api.createOrder(
      vendorId: payload.vendorId,
      customerId: payload.customerId,
      items: payload.items,
      fulfillment: payload.fulfillment,
      deliveryLocation: payload.deliveryLocation,
      note: payload.note,
    );
  },
);

class CreateOrderPayload {
  CreateOrderPayload({
    required this.vendorId,
    required this.customerId,
    required this.items,
    this.fulfillment = FulfillmentType.pickup,
    this.deliveryLocation,
    this.note,
  });

  final String vendorId;
  final String customerId;
  final List<OrderItem> items;
  final FulfillmentType fulfillment;
  final GeoPoint? deliveryLocation;
  final String? note;
}

// --- Cart ---
final cartProvider = NotifierProvider<CartNotifier, CartState>(CartNotifier.new);

class CartState {
  const CartState({this.vendorId, this.items = const []});

  final String? vendorId;
  final List<OrderItem> items;

  double get total => items.fold(0, (sum, item) => sum + item.lineTotal);
  bool get isEmpty => items.isEmpty;

  CartState copyWith({String? vendorId, List<OrderItem>? items}) => CartState(
        vendorId: vendorId ?? this.vendorId,
        items: items ?? this.items,
      );
}

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() => const CartState();

  void addProduct(Product product, {int quantity = 1}) {
    // enforce single-vendor cart for simplicity
    if (state.vendorId != null && state.vendorId != product.vendorId) {
      state = CartState(vendorId: product.vendorId, items: const []);
    } else if (state.vendorId == null) {
      state = state.copyWith(vendorId: product.vendorId);
    }

    final existingIndex = state.items.indexWhere((i) => i.productId == product.id);
    final updatedItems = [...state.items];
    if (existingIndex >= 0) {
      final existing = updatedItems[existingIndex];
      updatedItems[existingIndex] = existing.copyWith(
        quantity: existing.quantity + quantity,
      );
    } else {
      updatedItems.add(
        OrderItem(
          productId: product.id,
          name: product.name,
          unitPrice: product.price,
          quantity: quantity,
          currency: product.currency,
        ),
      );
    }
    state = state.copyWith(items: updatedItems);
  }

  void removeOne(String productId) {
    final idx = state.items.indexWhere((i) => i.productId == productId);
    if (idx == -1) return;
    final updated = [...state.items];
    final item = updated[idx];
    if (item.quantity <= 1) {
      updated.removeAt(idx);
    } else {
      updated[idx] = item.copyWith(quantity: item.quantity - 1);
    }
    state = state.copyWith(
      items: updated,
      vendorId: updated.isEmpty ? null : state.vendorId,
    );
  }

  void clear() => state = const CartState();
}
