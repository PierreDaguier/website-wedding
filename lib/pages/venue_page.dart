import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/responsive_scaffold.dart';
import '../localization.dart';
import '../widgets/venue_map_embed.dart';

/// Page présentant les informations sur le lieu de la cérémonie et le
/// programme détaillé de la journée.
class VenuePage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const VenuePage({super.key, this.onLocaleChange});

  static const String _mapEmbedUrl =
      'https://www.google.com/maps?q=Pethers%20Rainforest%20Retreat%2C%20Tamborine%20Mountain&output=embed';

  Widget _timelineItem({
    required BuildContext context,
    required String time,
    required String description,
    required IconData icon,
  }) {
    final accent = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
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
                  Text(
                    time,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _accessRow(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ResponsiveScaffold(
      titleKey: 'navProgram',
      onLocaleChange: onLocaleChange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool wide = constraints.maxWidth >= 900;
          final double maxContentWidth = constraints.maxWidth < 1200 ? constraints.maxWidth : 1200;
          final double horizontalPadding = constraints.maxWidth < 600
              ? 16
              : constraints.maxWidth < 1024
                  ? 32
                  : 64;

          Future<void> handleCopyAddress() async {
            await Clipboard.setData(
              ClipboardData(text: loc.translate('venueAddressValue')),
            );
          }

          Future<void> handleOpenMaps() async {
            final url = Uri.parse(
              'https://www.google.com/maps/search/?api=1&query=Pethers%20Rainforest%20Retreat%2C%20Tamborine%20Mountain',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          }

          Widget infoCard() {
            return Container(
              padding: const EdgeInsets.all(32),
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
                  Text(
                    loc.translate('venueHeading'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    loc.translate('venueSubtext'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    loc.translate('venueAddressLabel'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          loc.translate('venueAddressValue'),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: handleCopyAddress,
                        icon: const Icon(LucideIcons.copy, size: 16),
                        label: Text(loc.translate('venueCopyAddress')),
                      ),
                      IconButton(
                        onPressed: handleOpenMaps,
                        icon: const Icon(LucideIcons.mapPin, size: 18),
                        tooltip: loc.translate('mapTitle'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    loc.translate('venueAccessHeading'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  _accessRow(
                    context,
                    icon: LucideIcons.car,
                    text: loc.translate('venueAccessCar'),
                  ),
                  _accessRow(
                    context,
                    icon: LucideIcons.plane,
                    text: loc.translate('venueAccessPlane'),
                  ),
                  _accessRow(
                    context,
                    icon: LucideIcons.train,
                    text: loc.translate('venueAccessTrain'),
                  ),
                  _accessRow(
                    context,
                    icon: LucideIcons.bus,
                    text: loc.translate('venueAccessShuttle'),
                  ),
                ],
              ),
            );
          }

          Widget mapCard() {
            return Container(
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
                  Text(
                    loc.translate('mapTitle'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: buildVenueMapEmbed(_mapEmbedUrl),
                    ),
                  ),
                ],
              ),
            );
          }

          final timelineItems = [
            {
              'time': '15h30',
              'text': loc.translate('venueProgram1'),
              'icon': Icons.directions_car,
            },
            {
              'time': '16h00',
              'text': loc.translate('venueProgram2'),
              'icon': Icons.favorite,
            },
            {
              'time': '17h00',
              'text': loc.translate('venueProgram3'),
              'icon': Icons.local_bar,
            },
            {
              'time': '19h00',
              'text': loc.translate('venueProgram4'),
              'icon': Icons.restaurant,
            },
            {
              'time': '21h00',
              'text': loc.translate('venueProgram5'),
              'icon': Icons.music_note,
            },
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
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: wide
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: infoCard()),
                                  const SizedBox(width: 24),
                                  Expanded(child: mapCard()),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  infoCard(),
                                  const SizedBox(height: 24),
                                  SizedBox(height: 360, child: mapCard()),
                                ],
                              ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        loc.translate('venueProgramHeading'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 24),
                      Stack(
                        children: [
                          Positioned(
                            left: 19,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                            ),
                          ),
                          Column(
                            children: timelineItems
                                .map(
                                  (item) => _timelineItem(
                                    context: context,
                                    time: item['time'] as String,
                                    description: item['text'] as String,
                                    icon: item['icon'] as IconData,
                                  ),
                                )
                                .toList(),
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
