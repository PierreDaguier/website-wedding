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
          'Nous sommes ravis de partager avec vous cette journée exceptionnelle. Nous nous marierons le 1er août 2026 à Pethers Rainforest Retreat, sur le mont Tamborine, près de Brisbane. Sur ce site, vous trouverez toutes les informations nécessaires pour préparer votre venue et profiter de chaque moment.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Se rendre à la salle',
      'venueDescription':
          'La cérémonie et la réception auront lieu le 1er août 2026 à Pethers Rainforest Retreat, sur le mont Tamborine (Queensland), à environ 1h de Brisbane.',
      'venueAccessHeading': 'Accès',
      'venueAccessDescription':
          'Depuis Brisbane : comptez environ 1h de route via la M1 jusqu’à Beenleigh, puis suivez la Mount Tamborine Road jusqu’au village.\nDepuis l’aéroport de Brisbane : location de voiture recommandée (environ 1h15 à 1h30 selon le trafic).\nTransport public : train jusqu’à Beenleigh puis taxi/VTC jusqu’au mont Tamborine (prévoir 45 min supplémentaires).\nDes navettes et excursions privées existent également au départ de Brisbane ou de la Gold Coast.',
      'venueProgramHeading': 'Programme de la journée',
      'venueProgram1': 'Arrivée des invités',
      'venueProgram2': 'Cérémonie',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dîner',
      'venueProgram5': 'Soirée dansante',
      'australiaPageTitle': 'Australie',
      'australiaHeading1': 'Voyager vers l’Australie',
      'australiaText1':
          'Vérifiez la validité de votre passeport (valide au moins jusqu’à votre retour). Réservez vos vols à l’avance, surtout en haute saison. Pensez à l’assurance voyage et aux prises australiennes (type I).',
      'australiaHeading2': 'Visa pour l’Australie (depuis la France)',
      'australiaText2':
          'La plupart des visiteurs français utilisent le visa eVisitor (subclass 651) ou l’ETA. Faites la demande en ligne plusieurs semaines avant le départ.\nLien officiel : https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing',
      'australiaHeading3': 'Permis de conduire international',
      'australiaText3':
          'Si vous prévoyez de conduire, demandez un permis international gratuit depuis la France via l’ANTS. Délai variable, à anticiper.\nLien officiel : https://permisdeconduire.ants.gouv.fr/',
      'australiaHeading4': 'Téléphonie : carte prépayée Telstra',
      'australiaText4':
          'La couverture mobile la plus large est souvent assurée par Telstra. Vous pouvez acheter une carte prépayée (SIM ou eSIM) en ligne ou à l’arrivée.\nLien officiel : https://www.telstra.com.au/mobile-phones/prepaid-mobiles',
      'australiaHeading5': 'Numéros importants en Australie',
      'australiaText5':
          '• Urgences (police, pompiers, ambulance) : 000\n• Numéro international d’urgence (mobile) : 112\n• Police non urgente (QLD) : 131 444\n• Lifeline (soutien 24/7) : 13 11 14',
      'australiaHeading6': 'Douane & bagages',
      'australiaText6':
          'L’Australie applique des règles strictes de biosécurité. Déclarez toute nourriture, plantes, produits animaux ou équipements de plein air.\nEn cabine : liquides dans des contenants de 100 ml max (sachet 1 L). Les batteries lithium doivent rester en cabine.\nInfos officielles : https://www.abf.gov.au/entering-and-leaving-australia',
      'australiaHeading7': 'Santé & assurances',
      'australiaText7':
          'Souscrivez une assurance voyage couvrant les frais médicaux, l’annulation et la perte de bagages. Pensez à une protection solaire renforcée et à rester hydraté(e).',
      'australiaHeading8': 'Conseils pratiques',
      'australiaText8':
          '• Décalage horaire : +8 à +10 heures selon la saison\n• Conduite à gauche (attention aux ronds-points)\n• Paiement par carte largement accepté\n• Prévoir une veste légère le soir sur le mont Tamborine',
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
      // Titre utilisé pour le card de carte sur la page Programme
      'mapTitle': 'Localisation',
      // Texte du pied de page, l'année actuelle remplacera {year}
      'footerText': '© {year} Joanne & Pierre – Tous droits réservés',
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
          'We are delighted to share this wonderful day with you. We will get married on 1 August 2026 at Pethers Rainforest Retreat on Mount Tamborine, near Brisbane. On this site you will find all the information you need to prepare your visit and enjoy every moment.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Getting to the venue',
      'venueDescription':
          'The ceremony and reception will take place on 1 August 2026 at Pethers Rainforest Retreat on Mount Tamborine (Queensland), about one hour from Brisbane.',
      'venueAccessHeading': 'Access',
      'venueAccessDescription':
          'From Brisbane: allow around 1 hour by car via the M1 to Beenleigh, then follow Mount Tamborine Road to the village.\nFrom Brisbane Airport: car hire is recommended (around 1h15–1h30 depending on traffic).\nPublic transport: train to Beenleigh, then taxi/ride share to Mount Tamborine (allow an extra 45 minutes).\nPrivate shuttles and tours also operate from Brisbane or the Gold Coast.',
      'venueProgramHeading': 'Programme of the day',
      'venueProgram1': 'Guests arrive',
      'venueProgram2': 'Ceremony',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dinner',
      'venueProgram5': 'Dance party',
      'australiaPageTitle': 'Australia',
      'australiaHeading1': 'Travelling to Australia',
      'australiaText1':
          'Check that your passport is valid for your full stay. Book flights early, especially in peak season. Remember a travel adaptor (type I outlets).',
      'australiaHeading2': 'Visa for Australia (from France)',
      'australiaText2':
          'Most French visitors use the eVisitor (subclass 651) or ETA. Apply online several weeks before departure.\nOfficial link: https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing',
      'australiaHeading3': 'International driving permit',
      'australiaText3':
          'If you plan to drive, request a free international driving permit in France via ANTS. Processing times vary, so apply early.\nOfficial link: https://permisdeconduire.ants.gouv.fr/',
      'australiaHeading4': 'Phone service: Telstra prepaid',
      'australiaText4':
          'Telstra typically offers the widest coverage. You can buy a prepaid SIM or eSIM online or on arrival.\nOfficial link: https://www.telstra.com.au/mobile-phones/prepaid-mobiles',
      'australiaHeading5': 'Important phone numbers in Australia',
      'australiaText5':
          '• Emergency services (police, fire, ambulance): 000\n• International emergency number (mobile): 112\n• Police non-urgent (QLD): 131 444\n• Lifeline (24/7 support): 13 11 14',
      'australiaHeading6': 'Customs & luggage',
      'australiaText6':
          'Australia has strict biosecurity rules. Declare any food, plants, animal products, or outdoor equipment.\nCarry-on: liquids max 100 ml per container (1 L bag). Lithium batteries must stay in carry-on.\nOfficial info: https://www.abf.gov.au/entering-and-leaving-australia',
      'australiaHeading7': 'Health & insurance',
      'australiaText7':
          'Take out travel insurance covering medical costs, cancellation, and baggage loss. Sun protection is essential—stay hydrated.',
      'australiaHeading8': 'Practical tips',
      'australiaText8':
          '• Time difference: +8 to +10 hours depending on the season\n• Drive on the left (watch roundabouts)\n• Card payment widely accepted\n• Pack a light jacket for cool evenings on Mount Tamborine',
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
      'mapTitle': 'Location',
      'footerText': '© {year} Joanne & Pierre – All rights reserved',
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
