import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Un scaffold adaptatif qui affiche un Drawer sur mobile et une
/// NavigationRail sur les grands écrans.
///
/// Le titre est affiché dans la barre d'application. Les éléments du
/// menu sont définis dans une liste de cartes contenant le label, l'icône
/// et la route. L'élément sélectionné est mis en valeur.
import '../localization.dart';

/// Scaffold adaptatif intégrant un menu de navigation et un sélecteur de langue.
class ResponsiveScaffold extends StatelessWidget {
  /// Clé de traduction du titre de la page.
  final String titleKey;

  /// Contenu de la page.
  final Widget child;

  /// Callback déclenché lorsqu'on change de langue.
  final void Function(Locale)? onLocaleChange;

  const ResponsiveScaffold({
    super.key,
    required this.titleKey,
    required this.child,
    this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 800;
        final router = GoRouter.of(context);
        final String currentRoute = GoRouterState.of(context).uri.path;
        final loc = AppLocalizations.of(context);
        final navItems = [
          {'labelKey': 'navHome', 'icon': Icons.home, 'route': '/'},
          {'labelKey': 'navProgram', 'icon': Icons.event, 'route': '/venue'},
          {
            'labelKey': 'navAustralia',
            'icon': Icons.flight_takeoff,
            'route': '/australia'
          },
          {
            'labelKey': 'navContacts',
            'icon': Icons.contact_mail,
            'route': '/contact'
          },
        ];
        final int selectedIndex =
            navItems.indexWhere((item) => item['route'] == currentRoute);
        if (desktop) {
          return Row(
            children: [
              NavigationRail(
                selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
                onDestinationSelected: (index) {
                  final route = navItems[index]['route'] as String;
                  if (route != currentRoute) {
                    router.go(route);
                  }
                },
                labelType: NavigationRailLabelType.all,
                destinations: navItems
                    .map(
                      (item) => NavigationRailDestination(
                        icon: Icon(item['icon'] as IconData),
                        label: Text(loc.translate(item['labelKey'] as String)),
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(loc.translate(titleKey)),
                    actions: [
                      PopupMenuButton<Locale>(
                        icon: const Icon(Icons.language),
                        onSelected: (locale) => onLocaleChange?.call(locale),
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
                  ),
                  body: child,
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(loc.translate(titleKey)),
              actions: [
                PopupMenuButton<Locale>(
                  icon: const Icon(Icons.language),
                  onSelected: (locale) => onLocaleChange?.call(locale),
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
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      loc.translate('appTitle'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
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
            ),
            body: child,
          );
        }
      },
    );
  }
}
