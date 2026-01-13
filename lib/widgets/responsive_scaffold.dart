import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../localization.dart';
import 'footer.dart';

/// Scaffold adaptatif intégrant un menu de navigation et un sélecteur de langue.
class ResponsiveScaffold extends StatefulWidget {
  /// Hauteur du header pour aligner les sections internes.
  static const double navHeight = 72;

  /// Clé de traduction du titre de la page.
  final String titleKey;

  /// Contenu de la page.
  final Widget child;

  /// Callback déclenché lorsqu'on change de langue.
  final void Function(Locale)? onLocaleChange;

  /// Indique si la barre doit être transparente au-dessus du hero.
  final bool transparentHeader;

  const ResponsiveScaffold({
    super.key,
    required this.titleKey,
    required this.child,
    this.onLocaleChange,
    this.transparentHeader = false,
  });

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  bool _isScrolled = false;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical) return false;
    final bool scrolled = notification.metrics.pixels > 8;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;
        final router = GoRouter.of(context);
        final String currentRoute = GoRouterState.of(context).uri.path;
        final loc = AppLocalizations.of(context);
        final navItems = [
          {'labelKey': 'navHome', 'icon': Icons.home, 'route': '/'},
          {'labelKey': 'navProgram', 'icon': Icons.event, 'route': '/venue'},
          {'labelKey': 'navAustralia', 'icon': Icons.flight_takeoff, 'route': '/australia'},
          {'labelKey': 'navContacts', 'icon': Icons.contact_mail, 'route': '/contact'},
        ];

        final bool isTransparent = widget.transparentHeader && !_isScrolled;
        final Color textColor = isTransparent ? Colors.white : const Color(0xFF1B3B36);
        final Color backgroundColor = isTransparent ? Colors.transparent : const Color(0xFFF9F7F2);

        Widget buildNavLink(Map<String, Object> item) {
          final route = item['route'] as String;
          final bool selected = route == currentRoute;
          return TextButton(
            onPressed: () {
              if (route != currentRoute) {
                router.go(route);
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: textColor,
              textStyle: TextStyle(
                letterSpacing: 2,
                fontSize: 14,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            child: Text(loc.translate(item['labelKey'] as String).toUpperCase()),
          );
        }

        final navBar = AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: ResponsiveScaffold.navHeight,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: isTransparent
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    loc.translate('appTitle'),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (!isMobile)
                    Row(
                      children: [
                        ...navItems.map(buildNavLink),
                        PopupMenuButton<Locale>(
                          icon: Icon(Icons.language, color: textColor),
                          onSelected: (locale) => widget.onLocaleChange?.call(locale),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: const Locale('fr'),
                              child: Text(loc.translate('languageFr')),
                            ),
                            PopupMenuItem(
                              value: const Locale('en'),
                              child: Text(loc.translate('languageEn')),
                            ),
                          ],
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        PopupMenuButton<Locale>(
                          icon: Icon(Icons.language, color: textColor),
                          onSelected: (locale) => widget.onLocaleChange?.call(locale),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: const Locale('fr'),
                              child: Text(loc.translate('languageFr')),
                            ),
                            PopupMenuItem(
                              value: const Locale('en'),
                              child: Text(loc.translate('languageEn')),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.menu, color: textColor),
                            onPressed: () => Scaffold.of(context).openEndDrawer(),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );

        return Scaffold(
          endDrawer: isMobile
              ? Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color(0xFF1B3B36),
                        ),
                        child: Text(
                          loc.translate('appTitle'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      ...navItems.map((item) {
                        final route = item['route'] as String;
                        final bool selected = route == currentRoute;
                        return ListTile(
                          leading: Icon(item['icon'] as IconData),
                          title: Text(loc.translate(item['labelKey'] as String)),
                          selected: selected,
                          onTap: () {
                            Navigator.pop(context);
                            if (route != currentRoute) {
                              router.go(route);
                            }
                          },
                        );
                      }).toList(),
                    ],
                  ),
                )
              : null,
          body: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: Column(
                  children: [
                    Expanded(child: child),
                    const FooterWidget(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: navBar,
              ),
            ],
          ),
        );
      },
    );
  }
}
