import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

/// Page listant les différents moyens de contacter les mariés.
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Contacts',
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Nous contacter',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Joanne'),
            subtitle: const Text('joanne@example.com'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Pierre'),
            subtitle: const Text('pierre@example.com'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Téléphone'),
            subtitle: const Text('+61 4 00 00 00 00'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email général'),
            subtitle: const Text('mariage.joanne.pierre@example.com'),
          ),
        ],
      ),
    );
  }
}
