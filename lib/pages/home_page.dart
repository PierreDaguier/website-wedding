import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page d'accueil avec hero plein écran et intro centrée.
class HomePage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const HomePage({super.key, this.onLocaleChange});

  double _horizontalPadding(double width) {
    if (width < 600) {
      return 16;
    }
    if (width < 1024) {
      return 32;
    }
    return 64;
  }

  double _maxContentWidth(double width) {
    if (width < 1200) {
      return width;
    }
    return 1200;
  }

  Widget _infoCard({
    required BuildContext context,
    required String title,
    required String content,
    required String buttonLabel,
    required String buttonRoute,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go(buttonRoute),
            child: Text(buttonLabel.toUpperCase()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final langCode = Localizations.localeOf(context).languageCode;
    final heroAsset = langCode == 'en'
        ? 'assets/images/hero_en.png'
        : 'assets/images/hero_fr.png';
    return ResponsiveScaffold(
      titleKey: 'navHome',
      transparentHeader: true,
      onLocaleChange: onLocaleChange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxContentWidth = _maxContentWidth(constraints.maxWidth);
          final double horizontalPadding = _horizontalPadding(constraints.maxWidth);
          final bool isWide = constraints.maxWidth >= 900;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        heroAsset,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      Container(color: Colors.black.withOpacity(0.3)),
                      Padding(
                        padding: EdgeInsets.only(top: ResponsiveScaffold.navHeight),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                loc.translate('homeTitle'),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                loc.translate('homeDate'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.white70,
                                      letterSpacing: 2,
                                    ),
                              ),
                              const SizedBox(height: 32),
                              OutlinedButton(
                                onPressed: () => context.go('/venue'),
                                child: Text(loc.translate('homeCta').toUpperCase()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 80,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            loc.translate('homeWelcome'),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            loc.translate('homeIntro'),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 48),
                          LayoutBuilder(
                            builder: (context, innerConstraints) {
                              final bool threeColumns = innerConstraints.maxWidth >= 1100;
                              final double maxWidth = innerConstraints.maxWidth;
                              final double cardWidth = threeColumns
                                  ? (maxWidth - 48) / 3
                                  : isWide
                                      ? (maxWidth - 24) / 2
                                      : maxWidth;
                              return Wrap(
                                spacing: 24,
                                runSpacing: 24,
                                children: [
                                  SizedBox(
                                    width: cardWidth,
                                    child: _infoCard(
                                      context: context,
                                      title: loc.translate('venueHeading'),
                                      content: loc.translate('venueDescription'),
                                      buttonLabel: loc.translate('navProgram'),
                                      buttonRoute: '/venue',
                                    ),
                                  ),
                                  SizedBox(
                                    width: cardWidth,
                                    child: _infoCard(
                                      context: context,
                                      title: loc.translate('australiaPageTitle'),
                                      content: loc.translate('homeAustraliaDescription'),
                                      buttonLabel: loc.translate('navAustralia'),
                                      buttonRoute: '/australia',
                                    ),
                                  ),
                                  SizedBox(
                                    width: cardWidth,
                                    child: _infoCard(
                                      context: context,
                                      title: loc.translate('homeContactsTitle'),
                                      content: loc.translate('homeContactsDescription'),
                                      buttonLabel: loc.translate('navContacts'),
                                      buttonRoute: '/contacts',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
