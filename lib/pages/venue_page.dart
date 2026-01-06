import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page présentant les informations sur le lieu de la cérémonie et le
/// programme détaillé de la journée.
class VenuePage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const VenuePage({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ResponsiveScaffold(
      titleKey: 'navProgram',
      onLocaleChange: onLocaleChange,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool wide = constraints.maxWidth >= 900;
            // Sous-bannière commune
            final Widget subBanner = Container(
              height: 160,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                loc.translate('venueHeading'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );

            // Carte pour la description et l'accès
            Widget infoCard() {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.translate('venueDescription'),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        loc.translate('venueAccessHeading'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        loc.translate('venueAccessDescription'),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Carte pour la carte / plan
            Widget mapCard() {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.translate('mapTitle'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                        const SizedBox(height: 8),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              loc.translate('mapPlaceholder'),
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }

            // Carte pour le programme détaillé
            Widget programCard() {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.translate('venueProgramHeading'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      _programItem('15h30', loc.translate('venueProgram1')),
                      _programItem('16h00', loc.translate('venueProgram2')),
                      _programItem('17h00', loc.translate('venueProgram3')),
                      _programItem('19h00', loc.translate('venueProgram4')),
                      _programItem('21h00', loc.translate('venueProgram5')),
                    ],
                  ),
                ),
              );
            }

            if (wide) {
              // Disposition en grille deux colonnes : info & programme à gauche, carte à droite.
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  subBanner,
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            infoCard(),
                            const SizedBox(height: 16),
                            programCard(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: mapCard(),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              // Disposition empilée pour les petits écrans
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  subBanner,
                  const SizedBox(height: 16),
                  infoCard(),
                  mapCard(),
                  programCard(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  /// Widget utilitaire pour afficher une entrée du programme.
  Widget _programItem(String time, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}