import 'package:flutter/material.dart';
import '../localization.dart';

/// Un pied de page commun à toutes les pages de l'application.
///
/// Ce widget affiche un texte de copyright centré et utilise les
/// traductions définies dans `localization.dart`. Il récupère
/// automatiquement l'année courante afin de rester à jour dans le
/// temps sans modification manuelle. L'apparence du pied de page est
/// harmonisée avec la couleur principale du thème.
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final year = DateTime.now().year;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      color: Theme.of(context).primaryColor,
      child: Text(
        loc.translate('footerText').replaceAll('{year}', year.toString()),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              letterSpacing: 1.2,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
