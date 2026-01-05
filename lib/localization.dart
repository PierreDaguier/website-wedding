import 'package:flutter/material.dart';

/// Classe de gestion des localisations de l'application.
///
/// Cette implémentation minimaliste permet de définir un dictionnaire de
/// traductions pour les langues prises en charge et de récupérer la
/// traduction associée à une clé. Pour un projet plus vaste, on pourrait
/// utiliser les outils de génération fournis par Flutter (`flutter gen-l10n`).
class AppLocalizations {
  /// Création d'une instance avec la locale active.
  const AppLocalizations(this.locale);

  /// Locale actuellement utilisée.
  final Locale locale;

  /// Liste des langues prises en charge.
  static const supportedLocales = [Locale('fr'), Locale('en')];

  /// Vérifie si une locale est supportée.
  static bool isSupported(Locale locale) =>
      supportedLocales.map((e) => e.languageCode).contains(locale.languageCode);

  /// Dictionnaire des traductions par langue.
  static const Map<String, Map<String, String>> _localizedValues = {
    'fr': {
      'appTitle': 'Mariage Joanne & Pierre',
      'navHome': 'Accueil',
      'navProgram': 'Programme',
      'navAustralia': 'Australie',
      'navContacts': 'Contacts',
      'homeTitle': 'Joanne & Pierre',
      'homeWelcome': 'Bienvenue sur notre site de mariage !',
      'homeIntro':
          'Nous sommes ravis de partager avec vous cette journée exceptionnelle. Sur ce site, vous trouverez toutes les informations nécessaires pour préparer votre venue et profiter de chaque moment.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Se rendre à la salle',
      'venueDescription':
          'La cérémonie et la réception auront lieu au Domaine des Cygnes, 1234 Route des Fleurs, Brisbane, QLD, Australie.',
      'venueAccessHeading': 'Accès',
      'venueAccessDescription':
          'En voiture : un parking gratuit est disponible sur place.\nEn taxi / VTC : réservez votre course en précisant l’adresse.\nTransports en commun : la ligne de bus 12 s’arrête à 300 m du domaine.',
      'venueProgramHeading': 'Programme de la journée',
      'venueProgram1': 'Arrivée des invités',
      'venueProgram2': 'Cérémonie',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dîner',
      'venueProgram5': 'Soirée dansante',
      'australiaPageTitle': 'Australie',
      'australiaHeading1': 'Voyager vers l’Australie',
      'australiaText1':
          'Vérifiez la validité de votre passeport. La plupart des voyageurs auront besoin d’un visa pour entrer en Australie.',
      'australiaHeading2': 'Visa',
      'australiaText2':
          '• ETA (Electronic Travel Authority)\n• eVisitor\n\nFaites votre demande plusieurs semaines avant le départ.',
      'australiaHeading3': 'Santé & assurances',
      'australiaText3':
          '• Souscrivez une assurance voyage couvrant la santé et l’annulation\n• Vérifiez vos vaccins\n• Prévoyez un chapeau, de la crème solaire et restez hydraté ! ☀️',
      'australiaHeading4': 'Conseils pratiques',
      'australiaText4':
          '• Prises électriques de type I (prévoir un adaptateur)\n• Décalage horaire : +8 à +10 heures selon la saison\n• Conduite à gauche\n• Paiement par carte largement accepté',
      'contactPageTitle': 'Contacts',
      'contactHeading': 'Nous contacter',
      'contactJoanne': 'Joanne',
      'contactPierre': 'Pierre',
      'contactPhone': 'Téléphone',
      'contactEmailGeneral': 'Email général',
      'mapPlaceholder': 'Carte (bientôt disponible)',
      'languageFr': 'Français',
      'languageEn': 'English',
      'homeCta': 'Découvrir le programme',
    },
    'en': {
      'appTitle': 'Joanne & Pierre Wedding',
      'navHome': 'Home',
      'navProgram': 'Programme',
      'navAustralia': 'Australia',
      'navContacts': 'Contacts',
      'homeTitle': 'Joanne & Pierre',
      'homeWelcome': 'Welcome to our wedding website!',
      'homeIntro':
          'We are delighted to share this wonderful day with you. On this site you will find all the information you need to prepare your visit and enjoy every moment.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Getting to the venue',
      'venueDescription':
          'The ceremony and reception will take place at Domaine des Cygnes, 1234 Route des Fleurs, Brisbane, QLD, Australia.',
      'venueAccessHeading': 'Access',
      'venueAccessDescription':
          'By car: free parking is available on site.\nBy taxi / ride share: book your ride and give the address.\nPublic transport: bus line 12 stops 300 m from the estate.',
      'venueProgramHeading': 'Programme of the day',
      'venueProgram1': 'Guests arrive',
      'venueProgram2': 'Ceremony',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dinner',
      'venueProgram5': 'Dance party',
      'australiaPageTitle': 'Australia',
      'australiaHeading1': 'Travelling to Australia',
      'australiaText1':
          'Check that your passport is valid. Most travelers will require a visa to enter Australia.',
      'australiaHeading2': 'Visa',
      'australiaText2':
          '• ETA (Electronic Travel Authority)\n• eVisitor\n\nApply several weeks before departure.',
      'australiaHeading3': 'Health & insurance',
      'australiaText3':
          '• Take out travel insurance covering health and cancellation\n• Check your vaccinations\n• Bring a hat, sunscreen and stay hydrated! ☀️',
      'australiaHeading4': 'Practical tips',
      'australiaText4':
          '• Power outlets type I (bring an adapter)\n• Time difference: +8 to +10 hours depending on the season\n• Drive on the left\n• Card payment widely accepted',
      'contactPageTitle': 'Contacts',
      'contactHeading': 'Contact us',
      'contactJoanne': 'Joanne',
      'contactPierre': 'Pierre',
      'contactPhone': 'Phone',
      'contactEmailGeneral': 'General email',
      'mapPlaceholder': 'Map (coming soon)',
      'languageFr': 'Français',
      'languageEn': 'English',
      'homeCta': 'Discover the programme',
    },
  };

  /// Renvoie la traduction associée à la clé pour la locale courante.
  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  /// Récupère l'instance `AppLocalizations` depuis le contexte.
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

/// Délégue qui fournit des instances de `AppLocalizations` pour une locale donnée.
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}