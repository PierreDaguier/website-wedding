import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

/// Page regroupant les informations pour voyager en Australie.
class AustraliaPage extends StatelessWidget {
  const AustraliaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Australie',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Voyager vers l’Australie',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Vérifiez la validité de votre passeport. '
              'La plupart des voyageurs auront besoin d’un visa pour entrer en Australie.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Visa',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              '• ETA (Electronic Travel Authority)\n'
              '• eVisitor\n\n'
              'Faites votre demande plusieurs semaines avant le départ.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Santé & assurances',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              '• Souscrivez une assurance voyage couvrant la santé et l’annulation\n'
              '• Vérifiez vos vaccins\n'
              '• Prévoyez un chapeau, de la crème solaire et restez hydraté ! ☀️',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Conseils pratiques',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              '• Prises électriques de type I (prévoir un adaptateur)\n'
              '• Décalage horaire : +8 à +10 heures selon la saison\n'
              '• Conduite à gauche\n'
              '• Paiement par carte largement accepté',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
