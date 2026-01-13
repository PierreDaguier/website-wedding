import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';
import '../config/config.dart';

/// Page listant les différents moyens de contacter les mariés.
class ContactPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const ContactPage({super.key, this.onLocaleChange});

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
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Sous-bannière de la page Contacts
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          loc.translate('contactHeading'),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(loc.translate('contactJoanne')),
                              subtitle: Text(
                                displayValue(ContactConfig.emailJoanne),
                              ),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(loc.translate('contactPierre')),
                              subtitle: Text(
                                displayValue(ContactConfig.emailPierre),
                              ),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: Text(loc.translate('contactPhone')),
                              subtitle: Text(
                                displayValue(ContactConfig.phoneContact),
                              ),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: Text(loc.translate('contactEmailGeneral')),
                              subtitle: Text(
                                displayValue(ContactConfig.emailContact),
                              ),
                            ),
                          ],
                        ),
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
