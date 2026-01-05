import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';
import '../localization.dart';

/// Page listant les différents moyens de contacter les mariés.
class ContactPage extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const ContactPage({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ResponsiveScaffold(
      titleKey: 'navContacts',
      onLocaleChange: onLocaleChange,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            loc.translate('contactHeading'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(loc.translate('contactJoanne')),
            subtitle: const Text('joanne@example.com'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(loc.translate('contactPierre')),
            subtitle: const Text('pierre@example.com'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(loc.translate('contactPhone')),
            subtitle: const Text('+61 4 00 00 00 00'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(loc.translate('contactEmailGeneral')),
            subtitle: const Text('mariage.joanne.pierre@example.com'),
          ),
        ],
      ),
    );
  }
}
