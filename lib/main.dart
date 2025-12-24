import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'src/data/providers.dart';
import 'src/models/models.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: OpgDirektApp()));
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);
  return GoRouter(
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final user = ref.read(authProvider);
      final loggingIn = state.matchedLocation == '/auth';
      final atSplash = state.matchedLocation == '/';

      if (user == null && !loggingIn && !atSplash) return '/auth';
      if (user != null && (loggingIn || atSplash)) {
        return user.role == UserRole.vendor ? '/vendor' : '/home';
      }
      if (user?.role == UserRole.vendor && state.matchedLocation == '/home') {
        return '/vendor';
      }
      if (user?.role == UserRole.consumer && state.matchedLocation == '/vendor') {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/vendor',
        name: 'vendorDashboard',
        builder: (context, state) => const VendorDashboardScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'consumerHome',
        builder: (context, state) => const ConsumerHomeScreen(),
      ),
      GoRoute(
        path: '/checkout',
        name: 'cartCheckout',
        builder: (context, state) => const CartCheckoutScreen(),
      ),
    ],
  );
});

class OpgDirektApp extends ConsumerWidget {
  const OpgDirektApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'OPGDirekt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade700),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldShell(
      title: 'OPGDirekt',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Dobrodošli'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed('auth'),
            child: const Text('Prijava / Registracija'),
          ),
        ],
      ),
    );
  }
}

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider.notifier);
    return _ScaffoldShell(
      title: 'Prijava',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Stub za auth (email/SSO/phone).'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              auth.signIn(UserRole.consumer);
              context.goNamed('consumerHome');
            },
            child: const Text('Nastavi kao kupac'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              auth.signIn(UserRole.vendor);
              context.goNamed('vendorDashboard');
            },
            child: const Text('Nastavi kao OPG'),
          ),
        ],
      ),
    );
  }
}

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VendorDashboardView();
  }
}

class ConsumerHomeScreen extends ConsumerWidget {
  const ConsumerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsProvider);
    final cart = ref.watch(cartProvider);

    return _ScaffoldShell(
      title: 'OPG u blizini',
      actions: [
        IconButton(
          tooltip: 'Odjava',
          icon: const Icon(Icons.logout),
          onPressed: () {
            ref.read(authProvider.notifier).signOut();
            ref.read(cartProvider.notifier).clear();
            context.goNamed('auth');
          },
        ),
      ],
      body: vendorsAsync.when(
        data: (vendors) => ListView.separated(
          itemCount: vendors.length + (cart.isEmpty ? 0 : 1),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (!cart.isEmpty && index == 0) {
              return CartSummaryBanner(total: cart.total, count: cart.items.length);
            }
            final vendor = vendors[cart.isEmpty ? index : index - 1];
            return VendorCard(vendor: vendor);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Greška pri učitavanju: $err')),
      ),
    );
  }
}

class CartCheckoutScreen extends ConsumerStatefulWidget {
  const CartCheckoutScreen({super.key});

  @override
  ConsumerState<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends ConsumerState<CartCheckoutScreen> {
  FulfillmentType fulfillment = FulfillmentType.pickup;

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final auth = ref.watch(authProvider);
    return _ScaffoldShell(
      title: 'Košarica & Checkout',
      actions: [
        IconButton(
          tooltip: 'Isprazni košaricu',
          icon: const Icon(Icons.delete_outline),
          onPressed: cart.isEmpty
              ? null
              : () => ref.read(cartProvider.notifier).clear(),
        ),
      ],
      body: cart.isEmpty
          ? const Center(child: Text('Košarica je prazna.'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleButtons(
                  isSelected: [fulfillment == FulfillmentType.pickup, fulfillment == FulfillmentType.delivery],
                  onPressed: (idx) {
                    setState(() {
                      fulfillment = idx == 0 ? FulfillmentType.pickup : FulfillmentType.delivery;
                    });
                  },
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Pickup')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Dostava')),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Row(
                        children: [
                          Expanded(child: Text(item.name)),
                          Text('${item.quantity}x'),
                          const SizedBox(width: 8),
                          Text('${item.unitPrice.toStringAsFixed(2)} ${item.currency ?? 'EUR'}'),
                          const SizedBox(width: 8),
                          Text(item.lineTotal.toStringAsFixed(2)),
                          IconButton(
                            onPressed: () => ref.read(cartProvider.notifier).removeOne(item.productId),
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text('Ukupno: ${cart.total.toStringAsFixed(2)} EUR',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: (auth == null || cart.vendorId == null)
                      ? null
                      : () async {
                          final payload = CreateOrderPayload(
                            vendorId: cart.vendorId!,
                            customerId: auth.id,
                            items: cart.items,
                            fulfillment: fulfillment,
                          );
                          final order = await ref.read(createOrderProvider(payload).future);
                          if (!mounted) return;
                          ref.read(cartProvider.notifier).clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Narudžba ${order.id} kreirana')),
                          );
                          context.goNamed('consumerHome');
                        },
                  child: const Text('Plati (mock)'),
                ),
              ],
            ),
    );
  }
}

class VendorCard extends ConsumerWidget {
  const VendorCard({super.key, required this.vendor});

  final Vendor vendor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsByVendorProvider(vendor.id));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vendor.name, style: Theme.of(context).textTheme.titleMedium),
            if (vendor.description != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(vendor.description!),
              ),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                if (vendor.delivery?.radiusKm != null)
                  Chip(label: Text('Radius ${vendor.delivery!.radiusKm} km')),
                if (vendor.delivery?.deliveryAllowed ?? false)
                  const Chip(label: Text('Dostava')),
                if (vendor.delivery?.pickupAllowed ?? false)
                  const Chip(label: Text('Pickup')),
                ...vendor.tags.map((t) => Chip(label: Text(t))),
              ],
            ),
            const SizedBox(height: 8),
            productsAsync.when(
              data: (products) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Proizvodi (${products.length})',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  ...products.take(3).map(
                    (p) => Row(
                      children: [
                        Expanded(
                          child: Text('- ${p.name} · ${p.price.toStringAsFixed(2)} ${p.currency}'),
                        ),
                        IconButton(
                          tooltip: 'Dodaj u košaricu',
                          icon: const Icon(Icons.add_shopping_cart_outlined),
                          onPressed: () => ref.read(cartProvider.notifier).addProduct(p),
                        ),
                      ],
                    ),
                  ),
                  if (products.length > 3) const Text('...'),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () => context.goNamed('cartCheckout'),
                      child: const Text('Košarica'),
                    ),
                  ),
                ],
              ),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: LinearProgressIndicator(minHeight: 2),
              ),
              error: (err, stack) => Text('Proizvodi nedostupni: $err'),
            ),
          ],
        ),
      ),
    );
  }
}

class VendorDashboardView extends ConsumerWidget {
  const VendorDashboardView({super.key});

  static const _demoVendorId = 'v-1';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsProvider);
    return _ScaffoldShell(
      title: 'OPG Dashboard',
      actions: [
        IconButton(
          tooltip: 'Odjava',
          icon: const Icon(Icons.logout),
          onPressed: () {
            ref.read(authProvider.notifier).signOut();
            context.goNamed('auth');
          },
        ),
      ],
      body: vendorsAsync.when(
        data: (vendors) {
          final vendor = vendors.firstWhere(
            (v) => v.id == _demoVendorId,
            orElse: () => vendors.first,
          );
          final productsAsync = ref.watch(productsByVendorProvider(vendor.id));
          return ListView(
            children: [
              Text(vendor.name, style: Theme.of(context).textTheme.titleLarge),
              if (vendor.description != null) Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(vendor.description!),
              ),
              Text('Lokacija: ${vendor.location?.label ?? 'N/A'}'),
              if (vendor.delivery?.radiusKm != null)
                Text('Radius dostave: ${vendor.delivery!.radiusKm} km'),
              const SizedBox(height: 12),
              Text('Proizvodi', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              productsAsync.when(
                data: (products) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: products
                      .map((p) => Text('${p.name} — ${p.price.toStringAsFixed(2)} ${p.currency}'))
                      .toList(),
                ),
                loading: () => const LinearProgressIndicator(minHeight: 2),
                error: (err, stack) => Text('Greška: $err'),
              ),
              const SizedBox(height: 16),
              Text('Narudžbe (stub)', style: Theme.of(context).textTheme.titleMedium),
              const Text('Dodati listu narudžbi i promjenu statusa.'),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Greška pri učitavanju: $err')),
      ),
    );
  }
}

class _ScaffoldShell extends StatelessWidget {
  const _ScaffoldShell({required this.title, required this.body, this.actions});

  final String title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}

class CartSummaryBanner extends StatelessWidget {
  const CartSummaryBanner({super.key, required this.total, required this.count});

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: ListTile(
        title: Text('Košarica: $count artikala'),
        subtitle: Text('Ukupno ${total.toStringAsFixed(2)} EUR'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => context.goNamed('cartCheckout'),
      ),
    );
  }
}

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen<AppUser?>(authProvider, (_, __) => notifyListeners());
  }

  final Ref ref;
}
