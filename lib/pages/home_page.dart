import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';
import 'package:go_router/go_router.dart';

/// Page d'accueil du site de mariage.
///
/// Cette page comporte un bandeau visuel (hero) avec une photo et un
/// titre, ainsi qu'un texte d'introduction. Le bandeau utilise une
/// surcouche sombre pour améliorer la lisibilité du titre sur la photo.
/// Page d'accueil avec effet de fondu sur l'image de couverture.
class HomePage extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;

  const HomePage({super.key, this.onLocaleChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Démarre l'animation de fondu après un court délai pour éviter les glitchs.
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() => _opacity = 1.0);
      }
    });
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
      onLocaleChange: widget.onLocaleChange,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bandeau visuel réactif : la hauteur s'ajuste en fonction de la
            // taille de l'écran et ne dépasse pas une fraction de la hauteur
            // totale. Cela évite que l'image ne prenne tout l'écran sur les
            // grands moniteurs. Le ratio 16/9 est conservé et l'effet de
            // fondu est maintenu.
            Builder(
              builder: (context) {
                final size = MediaQuery.of(context).size;
                final double width = size.width;
                final double height = size.height;
                // Hauteur idéale basée sur le ratio 16:9 de l'image
                final double ratioHeight = width * 9.0 / 16.0;
                // Définir une hauteur maximale en fonction de la taille de l'écran
                double maxHeight;
                if (width < 600) {
                  // Écrans mobiles : bandeau limité à 35 % de la hauteur
                  maxHeight = height * 0.35;
                } else if (width < 1024) {
                  // Tablettes / écrans moyens : 45 %
                  maxHeight = height * 0.45;
                } else {
                  // Desktop : 50 %
                  maxHeight = height * 0.50;
                }
                // La hauteur finale est la plus petite entre le ratio et la limite
                final double heroHeight = ratioHeight < maxHeight ? ratioHeight : maxHeight;
                return SizedBox(
                  height: heroHeight,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _opacity,
                    child: Image.asset(
                      heroAsset,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.translate('homeWelcome'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.translate('homeIntro'),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/venue');
                    },
                    child: Text(loc.translate('homeCta')),
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