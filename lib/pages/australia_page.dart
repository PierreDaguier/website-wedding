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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool wide = constraints.maxWidth >= 900;
            final bool medium = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
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
                              width: (constraints.maxWidth - (columns - 1) * 16) / columns,
                              child: card,
                            ))
                        .toList(),
                  ),
                ],
              );
            }
            if (wide) {
              // 2 colonnes sur écran large
              return buildGrid(2);
            } else if (medium) {
              // 2 colonnes sur écran moyen
              return buildGrid(2);
            } else {
              // Une seule colonne sur mobile
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  subBanner,
                  const SizedBox(height: 16),
                  ...cards,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}