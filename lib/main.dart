import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'localization.dart';
import 'pages/home_page.dart';
import 'pages/venue_page.dart';
import 'pages/australia_page.dart';
import 'pages/contact_page.dart';
import 'config/config.dart';

/// Point d'entrée de l'application.
///
/// Configure le routeur et initialise l'application avec le thème
/// défini dans `AppTheme`. Le debug banner est désactivé.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContactConfig.load();
  runApp(const WeddingApp());
}

/// Application principale dotée de la prise en charge des langues.
class WeddingApp extends StatefulWidget {
  const WeddingApp({super.key});

  @override
  State<WeddingApp> createState() => _WeddingAppState();
}

class _WeddingAppState extends State<WeddingApp> {
  /// Locale courante de l'application. Par défaut l'anglais.
  Locale _locale = const Locale('en');

  /// Change la langue de l'application.
  void _setLocale(Locale locale) {
    if (!AppLocalizations.isSupported(locale)) return;
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(onLocaleChange: _setLocale),
        ),
        GoRoute(
          path: '/venue',
          builder: (context, state) => VenuePage(onLocaleChange: _setLocale),
        ),
        GoRoute(
          path: '/australia',
          builder: (context, state) => AustraliaPage(onLocaleChange: _setLocale),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => ContactPage(onLocaleChange: _setLocale),
        ),
      ],
    );
    return MaterialApp.router(
      title: AppLocalizations(_locale).translate('appTitle'),
      routerConfig: router,
      theme: AppTheme.theme,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
