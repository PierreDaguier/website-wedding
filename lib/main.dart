import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'pages/home_page.dart';
import 'pages/venue_page.dart';
import 'pages/australia_page.dart';
import 'pages/contact_page.dart';

/// Point d'entrée de l'application.
///
/// Configure le routeur et initialise l'application avec le thème
/// défini dans `AppTheme`. Le debug banner est désactivé.
void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/venue',
          builder: (context, state) => const VenuePage(),
        ),
        GoRoute(
          path: '/australia',
          builder: (context, state) => const AustraliaPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    );
    return MaterialApp.router(
      title: 'Mariage Joanne & Pierre',
      routerConfig: router,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}