import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

/// Page présentant les informations sur le lieu de la cérémonie et le
/// programme détaillé de la journée.
class VenuePage extends StatelessWidget {
  const VenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Programme',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Se rendre à la salle',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'La cérémonie et la réception auront lieu au Domaine des Cygnes, '
              '1234 Route des Fleurs, Brisbane, QLD, Australie.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Accès',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'En voiture : un parking gratuit est disponible sur place.\n'
              'En taxi / VTC : réservez votre course en précisant l’adresse.\n'
              'Transports en commun : la ligne de bus 12 s’arrête à 300 m du domaine.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Programme de la journée',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _programItem('15h30', 'Arrivée des invités'),
            _programItem('16h00', 'Cérémonie'),
            _programItem('17h00', 'Cocktail'),
            _programItem('19h00', 'Dîner'),
            _programItem('21h00', 'Soirée dansante'),
          ],
        ),
      ),
    );
  }

  /// Widget utilitaire pour afficher une entrée du programme.
  Widget _programItem(String time, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
