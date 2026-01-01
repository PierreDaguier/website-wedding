import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Un scaffold adaptatif qui affiche un Drawer sur mobile et une
/// NavigationRail sur les grands écrans.
///
/// Le titre est affiché dans la barre d'application. Les éléments du
/// menu sont définis dans une liste de cartes contenant le label, l'icône
/// et la route. L'élément sélectionné est mis en valeur.
class ResponsiveScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const ResponsiveScaffold({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 800;
        final router = GoRouter.of(context);
        final String currentRoute = router.location;
        final navItems = [
          {'label': 'Accueil', 'icon': Icons.home, 'route': '/'},
          {'label': 'Programme', 'icon': Icons.event, 'route': '/venue'},
          {'label': 'Australie', 'icon': Icons.flight_takeoff, 'route': '/australia'},
          {'label': 'Contacts', 'icon': Icons.contact_mail, 'route': '/contact'},
        ];
        final int selectedIndex = navItems.indexWhere((item) => item['route'] == currentRoute);
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
                        label: Text(item['label'] as String),
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(title: Text(title)),
                  body: child,
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      'Menu',
                      style: TextStyle(
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
                      title: Text(item['label'] as String),
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