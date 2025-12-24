import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: OpgDirektApp()));
}

final _router = GoRouter(
  initialLocation: '/',
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

class OpgDirektApp extends StatelessWidget {
  const OpgDirektApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OPGDirekt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade700),
        useMaterial3: true,
      ),
      routerConfig: _router,
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

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldShell(
      title: 'Prijava',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Stub za auth (email/SSO/phone).'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.goNamed('consumerHome'),
            child: const Text('Nastavi kao kupac'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed('vendorDashboard'),
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
    return _ScaffoldShell(
      title: 'OPG Dashboard',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Postavi proizvode, cijene, lokaciju i radius dostave.'),
          SizedBox(height: 8),
          Text('Brzi pregled narudžbi i status plaćanja.'),
        ],
      ),
    );
  }
}

class ConsumerHomeScreen extends StatelessWidget {
  const ConsumerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldShell(
      title: 'OPG u blizini',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Karta štandova + filtriranje dostupnosti.'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed('cartCheckout'),
            child: const Text('Otvori košaricu / checkout'),
          ),
        ],
      ),
    );
  }
}

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldShell(
      title: 'Košarica & Checkout',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Pickup ili dostava unutar radiusa.'),
          SizedBox(height: 8),
          Text('Stub plaćanja (Stripe).'),
        ],
      ),
    );
  }
}

class _ScaffoldShell extends StatelessWidget {
  const _ScaffoldShell({required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}
