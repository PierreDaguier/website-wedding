import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page regroupant les informations pour voyager en Australie.
class AustraliaPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const AustraliaPage({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ResponsiveScaffold(
      titleKey: 'navAustralia',
      onLocaleChange: onLocaleChange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool wide = constraints.maxWidth >= 900;
          final bool medium = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
          final double maxContentWidth = constraints.maxWidth < 1200 ? constraints.maxWidth : 1200;
          final double horizontalPadding = constraints.maxWidth < 600
              ? 16
              : constraints.maxWidth < 1024
                  ? 32
                  : 64;
          final double contentWidth = math.max(0, maxContentWidth - horizontalPadding * 2);
          // Sous-bannière
          final Widget subBanner = Container(
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              loc.translate('australiaPageTitle'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
          // Fonction pour créer une carte à partir d'une clé de titre et de texte
          Widget buildCard(String headingKey, String textKey) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.translate(headingKey),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.translate(textKey),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }
          final cards = [
            buildCard('australiaHeading1', 'australiaText1'),
            buildCard('australiaHeading2', 'australiaText2'),
            buildCard('australiaHeading3', 'australiaText3'),
            buildCard('australiaHeading4', 'australiaText4'),
            buildCard('australiaHeading5', 'australiaText5'),
            buildCard('australiaHeading6', 'australiaText6'),
            buildCard('australiaHeading7', 'australiaText7'),
            buildCard('australiaHeading8', 'australiaText8'),
          ];

          Widget buildGrid(int columns) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                subBanner,
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: cards
                      .map((card) => SizedBox(
                            width: (contentWidth - (columns - 1) * 16) / columns,
                            child: card,
                          ))
                      .toList(),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 16,
                  ),
                  child: wide || medium
                      ? buildGrid(2)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            subBanner,
                            const SizedBox(height: 16),
                            ...cards,
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
