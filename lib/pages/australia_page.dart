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
          final double maxContentWidth =
              constraints.maxWidth < 1200 ? constraints.maxWidth : 1200;
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
              title: loc.translate('australiaVisaTitle'),
              summary: loc.translate('australiaVisaSummary'),
              details: TextSpan(
                text: loc.translate('australiaVisaDetailsIntro'),
                children: [
                  TextSpan(
                    text: loc.translate('australiaVisaDetailsHighlight'),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: loc.translate('australiaVisaDetailsOutro'),
                  ),
                ],
              ),
              actionLabel: loc.translate('australiaVisaAction'),
              actionUrl: 'https://immi.homeaffairs.gov.au',
              primaryAction: true,
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.directions_car,
              title: loc.translate('australiaRoadTitle'),
              summary: loc.translate('australiaRoadSummary'),
              details: TextSpan(
                text: loc.translate('australiaRoadDetails'),
              ),
            ),
            _TravelInfoCardData(
              icon: Icons.eco,
              title: loc.translate('australiaCustomsTitle'),
              summary: loc.translate('australiaCustomsSummary'),
              details: TextSpan(
                text: loc.translate('australiaCustomsDetails'),
              ),
              actionLabel: loc.translate('australiaCustomsAction'),
              actionUrl:
                  'https://www.abf.gov.au/entering-and-leaving-australia/can-you-bring-it-in',
              actionColor: const Color(0xFFD4AF37),
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.shield,
              title: loc.translate('australiaSafetyTitle'),
              summary: loc.translate('australiaSafetySummary'),
              details: TextSpan(
                text: loc.translate('australiaSafetyDetails'),
              ),
            ),
            _TravelInfoCardData(
              icon: Icons.wifi,
              title: loc.translate('australiaConnectedTitle'),
              summary: loc.translate('australiaConnectedSummary'),
              details: TextSpan(
                text: loc.translate('australiaConnectedDetails'),
              ),
              actionLabel: loc.translate('australiaConnectedAction'),
              actionUrl:
                  'https://www.telstra.com.au/mobile-phones/prepaid-mobiles',
              actionIsButton: true,
            ),
            _TravelInfoCardData(
              icon: Icons.map,
              title: loc.translate('australiaTransportTitle'),
              summary: loc.translate('australiaTransportSummary'),
              details: TextSpan(
                text: loc.translate('australiaTransportDetails'),
              ),
              modalLinks: [
                _ModalLink(
                  label: loc.translate('australiaTransportLinkLabel'),
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
                      const SizedBox(height: ResponsiveScaffold.navHeight + 16),
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
                color: Colors.black.withValues(alpha: _hovered ? 0.12 : 0.06),
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
                  color: accent.withValues(alpha: 0.15),
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
          final baseColor = actionColor ?? theme.colorScheme.secondary;
          return ElevatedButton(
            onPressed: followLink,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.hovered)) {
                    return baseColor.withValues(alpha: 0.9);
                  }
                  return baseColor;
                },
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              shape: WidgetStateProperty.all(
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
            textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
              (states) {
                final isHovered = states.contains(WidgetState.hovered);
                return theme.textTheme.bodyMedium?.copyWith(
                  decoration: isHovered ? TextDecoration.underline : null,
                );
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(WidgetState.hovered)) {
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
