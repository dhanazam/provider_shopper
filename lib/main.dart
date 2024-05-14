import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/screens/login.dart';
import 'package:provider_shopper/screens/catalog.dart';
import 'package:provider_shopper/screens/cart.dart';

void main() {
  runApp(const MainApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MyLogin()
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      )
    ]
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shopping',
      theme: appTheme,
      routerConfig: router(),
    );
  }
}