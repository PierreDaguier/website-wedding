import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
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
    required List<Widget> details,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
          ...details,
        ],
      ),
    );
  }

  Widget _contactLink({
    required BuildContext context,
    required String value,
    required Uri uri,
  }) {
    final theme = Theme.of(context);
    if (value.isEmpty) {
      return Text(
        '—',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge,
      );
    }
    return Link(
      uri: uri,
      target: LinkTarget.blank,
      builder: (context, followLink) => TextButton(
        onPressed: followLink,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            theme.colorScheme.secondary.withValues(alpha: 0.08),
          ),
          textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (states) {
              final isHovered = states.contains(WidgetState.hovered);
              return theme.textTheme.bodyLarge?.copyWith(
                decoration: isHovered ? TextDecoration.underline : null,
              );
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.hovered)) {
                return theme.colorScheme.secondary;
              }
              return theme.textTheme.bodyLarge?.color ??
                  theme.colorScheme.secondary;
            },
          ),
        ),
        child: Text(value, textAlign: TextAlign.center),
      ),
    );
  }

  Uri _emailUri(String email) => Uri(
        scheme: 'mailto',
        path: email,
      );

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
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
                      const SizedBox(height: ResponsiveScaffold.navHeight + 16),
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
                            width: isWide ? (maxContentWidth - 24) / 2 : 420,
                            child: _contactItem(
                              context: context,
                              icon: Icons.email,
                              title: loc.translate('contactEmail'),
                              details: [
                                _contactLink(
                                  context: context,
                                  value: ContactConfig.emailContact,
                                  uri: _emailUri(ContactConfig.emailContact),
                                ),
                              ],
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
