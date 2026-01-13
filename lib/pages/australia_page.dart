import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page regroupant les informations pour voyager en Australie.
class AustraliaPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const AustraliaPage({super.key, this.onLocaleChange});

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
          const double spacing = 24;
          final cards = [
            _TravelInfoCardData(
              icon: Icons.public,
              title: 'Tourist Visa (eVisitor)',
              summary: 'Free for European citizens. Valid for 3 months.',
              details: const TextSpan(
                text:
                    'Most European passport holders need an ',
                children: [
                  TextSpan(
                    text: 'eVisitor (Subclass 651)',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        '. It is completely free and allows you to stay for up to 3 months. Don\'t pay for third-party agencies!',
                  ),
                ],
              ),
              actionLabel: 'Apply on Official Govt Site',
              actionUrl: 'https://immi.homeaffairs.gov.au',
              primaryAction: true,
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.directions_car,
              title: 'On the Road',
              summary: 'We drive on the LEFT. Strict speed limits.',
              details: const TextSpan(
                text:
                    'Keep left! Speed cameras are everywhere and tolerance is low. Your domestic license is usually valid if it\'s in English, otherwise carry an International Driving Permit.',
              ),
            ),
            _TravelInfoCardData(
              icon: Icons.eco,
              title: 'Customs & Borders',
              summary: 'Strict rules on food and organic items.',
              details: const TextSpan(
                text:
                    'Australia has the strictest biosecurity in the world. You must DECLARE all food, wood, or plant materials on your incoming passenger card. If in doubt, declare it.',
              ),
              actionLabel: 'Check what you can bring',
              actionUrl:
                  'https://www.abf.gov.au/entering-and-leaving-australia',
              actionColor: Color(0xFFD4AF37),
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.shield,
              title: 'Safety & Assistance',
              summary: 'Important numbers for your stay.',
              details: const TextSpan(
                text: 'Emergencies (Police/Fire/Ambulance): 000\n'
                    'Non-emergency Police: 131 444\n'
                    'Roadside Assistance (RACQ): 13 19 05\n'
                    'State Emergency Service (SES): 132 500',
              ),
            ),
            _TravelInfoCardData(
              icon: Icons.wifi,
              title: 'Staying Connected',
              summary: 'Get a local prepaid SIM card.',
              details: const TextSpan(
                text:
                    'Telstra offers the best coverage in rural areas like Tamborine Mountain. You can buy a prepaid SIM at the airport or any convenience store.',
              ),
              actionLabel: 'Visit Telstra Site',
              actionUrl:
                  'https://www.telstra.com.au/mobile-phones/prepaid-mobiles',
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.map,
              title: 'Getting Around',
              summary: 'Public transport and car rentals.',
              details: const TextSpan(
                text:
                    'Public Transport: Use TransLink for bus/train schedules in QLD.\n'
                    'Car Rentals: We recommend booking at Brisbane Airport (BNE) via Avis, Hertz, or Europcar.',
              ),
              modalLinks: const [
                _ModalLink(
                  label: 'TransLink',
                  url: 'https://translink.com.au/',
                ),
              ],
              useModal: true,
            ),
          ];
          final double cardWidth =
              (maxContentWidth - spacing * (columns - 1)) / columns;
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
                      Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: [
                          for (final card in cards)
                            SizedBox(
                              width: cardWidth,
                              child: _ExpandableInfoCard(card: card),
                            ),
                        ],
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

class _TravelInfoCardData {
  final IconData icon;
  final String title;
  final String summary;
  final TextSpan details;
  final String? actionLabel;
  final String? actionUrl;
  final bool primaryAction;
  final bool actionIsButton;
  final Color? actionColor;
  final bool useModal;
  final List<_ModalLink> modalLinks;

  const _TravelInfoCardData({
    required this.icon,
    required this.title,
    required this.summary,
    required this.details,
    this.actionLabel,
    this.actionUrl,
    this.primaryAction = false,
    this.actionIsButton = false,
    this.actionColor,
    this.useModal = false,
    this.modalLinks = const [],
  });
}

class _ModalLink {
  final String label;
  final String url;

  const _ModalLink({required this.label, required this.url});
}

class _ExpandableInfoCard extends StatefulWidget {
  final _TravelInfoCardData card;

  const _ExpandableInfoCard({required this.card});

  @override
  State<_ExpandableInfoCard> createState() => _ExpandableInfoCardState();
}

class _ExpandableInfoCardState extends State<_ExpandableInfoCard> {
  bool _hovered = false;
  bool _expanded = false;

  void _setHovered(bool value) {
    setState(() => _hovered = value);
  }

  void _toggleExpanded() {
    setState(() => _expanded = !_expanded);
  }

  void _showModal() {
    final card = widget.card;
    showDialog<void>(
      context: context,
      builder: (context) {
        final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF1B3B36),
              height: 1.6,
            );
        return AlertDialog(
          title: Text(card.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(card.details, style: bodyStyle),
              if (card.modalLinks.isNotEmpty) ...[
                const SizedBox(height: 16),
                for (final link in card.modalLinks)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _ActionLink(
                      label: link.label,
                      url: link.url,
                      primary: true,
                      actionColor: Theme.of(context).colorScheme.secondary,
                      isButton: true,
                    ),
                  ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;
    const bodyColor = Color(0xFF1B3B36);
    final detailsStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: bodyColor,
          height: 1.6,
        );
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.card.useModal ? _showModal : _toggleExpanded,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hovered ? 0.12 : 0.06),
                blurRadius: _hovered ? 28 : 20,
                offset: const Offset(0, 6),
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
                child: Icon(widget.card.icon, color: accent),
              ),
              const SizedBox(height: 16),
              Text(
                widget.card.title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: bodyColor,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.card.summary,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: bodyColor,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 12),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      widget.card.details,
                      textAlign: TextAlign.left,
                      style: detailsStyle,
                    ),
                    if (widget.card.actionLabel != null &&
                        widget.card.actionUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Align(
                          alignment: widget.card.actionIsButton
                              ? Alignment.center
                              : Alignment.centerLeft,
                          child: _ActionLink(
                            label: widget.card.actionLabel!,
                            url: widget.card.actionUrl!,
                            primary: widget.card.primaryAction,
                            isButton: widget.card.actionIsButton,
                            actionColor: widget.card.actionColor,
                          ),
                        ),
                      ),
                  ],
                ),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionLink extends StatelessWidget {
  final String label;
  final String url;
  final bool primary;
  final bool isButton;
  final Color? actionColor;

  const _ActionLink({
    required this.label,
    required this.url,
    this.primary = false,
    this.isButton = false,
    this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank,
      builder: (context, followLink) {
        if (primary || isButton) {
          final baseColor =
              actionColor ?? theme.colorScheme.secondary;
          return ElevatedButton(
            onPressed: followLink,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return baseColor.withOpacity(0.9);
                  }
                  return baseColor;
                },
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Text(label),
          );
        }
        return TextButton(
          onPressed: followLink,
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
              (states) {
                final isHovered = states.contains(MaterialState.hovered);
                return theme.textTheme.bodyMedium?.copyWith(
                  decoration: isHovered ? TextDecoration.underline : null,
                );
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return theme.colorScheme.secondary;
                }
                return theme.textTheme.bodyMedium?.color ??
                    theme.colorScheme.secondary;
              },
            ),
          ),
          child: Text(label),
        );
      },
    );
  }
}
