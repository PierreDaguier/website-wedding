import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

/// Page d'accueil du site de mariage.
///
/// Cette page comporte un bandeau visuel (hero) avec une photo et un
/// titre, ainsi qu'un texte d'introduction. Le bandeau utilise une
/// surcouche sombre pour améliorer la lisibilité du titre sur la photo.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Accueil',
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Section visuelle principale
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/hero.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black.withOpacity(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Joanne & Pierre',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenue sur notre site de mariage !',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nous sommes ravis de partager avec vous cette journée exceptionnelle. '
                    'Sur ce site, vous trouverez toutes les informations nécessaires pour préparer votre venue et profiter de chaque moment.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
