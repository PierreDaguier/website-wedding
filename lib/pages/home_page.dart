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
            // Bandeau visuel réactif : conserve le ratio de l'image afin de
            // supprimer les effets de rognage. L'effet de fondu est conservé.
            AspectRatio(
              aspectRatio: 16 / 9,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity,
                child: Image.asset(
                  heroAsset,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
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
