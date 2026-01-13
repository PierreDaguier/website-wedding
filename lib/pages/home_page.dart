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

  /// Construit une section alternant texte et image. Si [reverse] est vrai,
  /// l'image et le texte sont inversés sur les écrans larges. Sur mobile,
  /// les éléments sont empilés dans l'ordre.
  Widget _buildSection({
    required BuildContext context,
    required String imageAsset,
    required String title,
    required String content,
    required String buttonLabel,
    required String buttonRoute,
    bool reverse = false,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 900;
        final Widget image = ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        );
        final Widget imageWidget = isWide
            ? image
            : AspectRatio(
                aspectRatio: 16 / 9,
                child: image,
              );
        final Widget textWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(buttonRoute),
              child: Text(buttonLabel),
            ),
          ],
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: reverse
                      ? [
                          Flexible(child: textWidget),
                          const SizedBox(width: 24),
                          Flexible(child: imageWidget),
                        ]
                      : [
                          Flexible(child: imageWidget),
                          const SizedBox(width: 24),
                          Flexible(child: textWidget),
                        ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    imageWidget,
                    const SizedBox(height: 16),
                    textWidget,
                  ],
                ),
        );
      },
    );
  }

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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxContentWidth = _maxContentWidth(constraints.maxWidth);
          final double horizontalPadding = _horizontalPadding(constraints.maxWidth);
          return SingleChildScrollView(
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
                    // Calcule une hauteur maximale basée sur le type d'écran afin
                    // d'éviter que la bannière ne prenne toute la hauteur et de
                    // préserver un aspect harmonieux sans pixellisation. Les
                    // valeurs ci-dessous s'inspirent des meilleures pratiques en
                    // design responsive (ex : Squarespace, Webflow).
                    if (width < 600) {
                      // Téléphones : limités à 40 % de la hauteur
                      maxHeight = height * 0.40;
                    } else if (width < 1024) {
                      // Tablettes / écrans moyens : limités à 45 %
                      maxHeight = height * 0.45;
                    } else {
                      // Grands écrans : limités à 45 % pour garder de l'espace
                      maxHeight = height * 0.45;
                    }
                    // Option : ne pas dépasser une hauteur absolue (en pixels)
                    const double absoluteMaxHeight = 700.0;
                    if (maxHeight > absoluteMaxHeight) {
                      maxHeight = absoluteMaxHeight;
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
                Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 16,
                      ),
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
                          // Sections supplémentaires alternant image et texte pour guider
                          // l'utilisateur vers les autres pages clés du site. Le choix des
                          // images utilise l'autre version linguistique pour varier.
                          Builder(builder: (context) {
                            final String altImage = langCode == 'en'
                                ? 'assets/images/hero_fr.png'
                                : 'assets/images/hero_en.png';
                            return Column(
                              children: [
                                _buildSection(
                                  context: context,
                                  imageAsset: heroAsset,
                                  title: loc.translate('venueHeading'),
                                  content: loc.translate('venueDescription'),
                                  buttonLabel: loc.translate('navProgram'),
                                  buttonRoute: '/venue',
                                  reverse: false,
                                ),
                                _buildSection(
                                  context: context,
                                  imageAsset: altImage,
                                  title: loc.translate('australiaHeading1'),
                                  content: loc.translate('australiaText1'),
                                  buttonLabel: loc.translate('navAustralia'),
                                  buttonRoute: '/australia',
                                  reverse: true,
                                ),
                              ],
                            );
                          }),
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
