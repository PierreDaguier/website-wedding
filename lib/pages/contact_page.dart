import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';
import '../config/config.dart';

/// Page listant les différents moyens de contacter les mariés.
class ContactPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const ContactPage({super.key, this.onLocaleChange});

  Widget _contactItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
        children: [
          Icon(icon, size: 28, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    String displayValue(String value) => value.isNotEmpty ? value : '—';
    return ResponsiveScaffold(
      titleKey: 'navContacts',
      onLocaleChange: onLocaleChange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxContentWidth =
              constraints.maxWidth < 960 ? constraints.maxWidth : 960;
          final double horizontalPadding = constraints.maxWidth < 600
              ? 16
              : constraints.maxWidth < 1024
                  ? 32
                  : 64;
          final bool isWide = constraints.maxWidth >= 700;
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: ResponsiveScaffold.navHeight + 16),
                      Text(
                        loc.translate('contactHeading'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 24,
                        runSpacing: 24,
                        children: [
                          SizedBox(
                            width: isWide
                                ? (maxContentWidth - 24) / 2
                                : maxContentWidth,
                            child: _contactItem(
                              context: context,
                              icon: Icons.person,
                              title: loc.translate('contactJoanne'),
                              value: displayValue(ContactConfig.emailJoanne),
                            ),
                          ),
                          SizedBox(
                            width: isWide
                                ? (maxContentWidth - 24) / 2
                                : maxContentWidth,
                            child: _contactItem(
                              context: context,
                              icon: Icons.person,
                              title: loc.translate('contactPierre'),
                              value: displayValue(ContactConfig.emailPierre),
                            ),
                          ),
                          SizedBox(
                            width: isWide
                                ? (maxContentWidth - 24) / 2
                                : maxContentWidth,
                            child: _contactItem(
                              context: context,
                              icon: Icons.phone,
                              title: loc.translate('contactPhone'),
                              value: displayValue(ContactConfig.phoneContact),
                            ),
                          ),
                          SizedBox(
                            width: isWide
                                ? (maxContentWidth - 24) / 2
                                : maxContentWidth,
                            child: _contactItem(
                              context: context,
                              icon: Icons.email,
                              title: loc.translate('contactEmailGeneral'),
                              value: displayValue(ContactConfig.emailContact),
                            ),
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
