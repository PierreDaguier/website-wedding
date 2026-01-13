import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page regroupant les informations pour voyager en Australie.
class AustraliaPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const AustraliaPage({super.key, this.onLocaleChange});

  IconData _iconForKey(String key) {
    switch (key) {
      case 'australiaHeading1':
        return Icons.flight_takeoff;
      case 'australiaHeading2':
        return Icons.assignment;
      case 'australiaHeading3':
        return Icons.directions_car;
      case 'australiaHeading4':
        return Icons.sim_card;
      case 'australiaHeading5':
        return Icons.support_agent;
      case 'australiaHeading6':
        return Icons.luggage;
      case 'australiaHeading7':
        return Icons.health_and_safety;
      case 'australiaHeading8':
        return Icons.tips_and_updates;
      default:
        return Icons.public;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ResponsiveScaffold(
      titleKey: 'navAustralia',
      onLocaleChange: onLocaleChange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxContentWidth = constraints.maxWidth < 1200 ? constraints.maxWidth : 1200;
          final double horizontalPadding = constraints.maxWidth < 600
              ? 16
              : constraints.maxWidth < 1024
                  ? 32
                  : 64;
          int columns = 1;
          if (constraints.maxWidth >= 1100) {
            columns = 3;
          } else if (constraints.maxWidth >= 600) {
            columns = 2;
          }
          final items = [
            {'heading': 'australiaHeading1', 'text': 'australiaText1'},
            {'heading': 'australiaHeading2', 'text': 'australiaText2'},
            {'heading': 'australiaHeading3', 'text': 'australiaText3'},
            {'heading': 'australiaHeading4', 'text': 'australiaText4'},
            {'heading': 'australiaHeading5', 'text': 'australiaText5'},
            {'heading': 'australiaHeading6', 'text': 'australiaText6'},
            {'heading': 'australiaHeading7', 'text': 'australiaText7'},
            {'heading': 'australiaHeading8', 'text': 'australiaText8'},
          ];
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: ResponsiveScaffold.navHeight + 16),
                      Text(
                        loc.translate('australiaPageTitle'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: columns == 3 ? 0.75 : 0.9,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final headingKey = item['heading'] as String;
                          final textKey = item['text'] as String;
                          return _HoverInfoCard(
                            icon: _iconForKey(headingKey),
                            title: loc.translate(headingKey),
                            content: loc.translate(textKey),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HoverInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;

  const _HoverInfoCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  State<_HoverInfoCard> createState() => _HoverInfoCardState();
}

class _HoverInfoCardState extends State<_HoverInfoCard> {
  bool _hovered = false;

  void _setHovered(bool value) {
    setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: accent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(widget.icon, color: accent),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                widget.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
