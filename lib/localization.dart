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
      'homeDate': '1er août 2026',
      'homeWelcome': 'Bienvenue sur notre site de mariage !',
      'homeIntro':
          'Nous sommes ravis de partager avec vous cette journée exceptionnelle. Nous nous marierons le 1er août 2026 à Pethers Rainforest Retreat, sur le mont Tamborine, près de Brisbane. Sur ce site, vous trouverez toutes les informations nécessaires pour préparer votre venue et profiter de chaque moment.',
      'homeAustraliaDescription':
          'Conseils visa, douanes, sécurité et téléphonie pour préparer votre voyage.',
      'homeContactsTitle': 'Contacts',
      'homeContactsDescription':
          'Toutes les coordonnées pour nous joindre facilement.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Accès au lieu',
      'venueDescription':
          'Toutes les infos pour venir à Pethers Rainforest Retreat et organiser votre trajet.',
      'venueSubtext':
          'La cérémonie et la réception auront lieu le 1er août 2026 à Pethers Rainforest Retreat.',
      'venueAddressLabel': 'Adresse',
      'venueAddressValue': '28B Geissmann St, Tamborine Mountain QLD 4272',
      'venueAccessHeading': 'Accès',
      'venueAccessCar':
          'En voiture : 1h depuis Brisbane via la M1 et Mount Tamborine Rd.',
      'venueAccessPlane':
          'Depuis l’aéroport : 1h15 de route. Location de voiture recommandée.',
      'venueAccessTrain':
          'Transports publics : train jusqu’à Beenleigh, puis 45 min de taxi/Uber.',
      'venueAccessShuttle':
          'Navettes : privées disponibles depuis Brisbane/Gold Coast.',
      'venueProgramHeading': 'Programme de la journée',
      'venueProgram1': 'Arrivée des invités',
      'venueProgram2': 'Cérémonie',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dîner',
      'venueProgram5': 'Soirée dansante',
      'australiaPageTitle': 'Voyager en Australie',
      'australiaVisaTitle': 'Visa touristique (eVisitor)',
      'australiaVisaSummary':
          'Gratuit pour les ressortissants européens. Valable 3 mois.',
      'australiaVisaDetailsIntro':
          'La plupart des passeports européens nécessitent un ',
      'australiaVisaDetailsHighlight': 'eVisitor (Subclass 651)',
      'australiaVisaDetailsOutro':
          '. Il est entièrement gratuit et permet de séjourner jusqu’à 3 mois. N’utilisez pas d’agences tierces.',
      'australiaVisaAction': 'Faire la demande officielle',
      'australiaRoadTitle': 'Sur la route',
      'australiaRoadSummary':
          'On conduit à gauche. Limites strictes.',
      'australiaRoadDetails':
          'Gardez la gauche ! Les radars sont partout et la tolérance est faible. Votre permis français est généralement valide s’il est en anglais, sinon prenez un permis international.',
      'australiaCustomsTitle': 'Douanes & frontières',
      'australiaCustomsSummary':
          'Règles strictes sur la nourriture et le végétal.',
      'australiaCustomsDetails':
          'L’Australie applique l’une des biosécurités les plus strictes au monde. Vous devez DÉCLARER toute nourriture, bois ou matière végétale sur votre carte d’arrivée. En cas de doute, déclarez.',
      'australiaCustomsAction': 'Vérifier ce que vous pouvez apporter',
      'australiaSafetyTitle': 'Sécurité & assistance',
      'australiaSafetySummary': 'Numéros utiles pendant votre séjour.',
      'australiaSafetyDetails':
          'Urgences (police/pompiers/ambulance) : 000\nPolice non urgente : 131 444\nAssistance routière (RACQ) : 13 19 05\nService d’urgence de l’État (SES) : 132 500',
      'australiaConnectedTitle': 'Rester connecté',
      'australiaConnectedSummary': 'Acheter une carte SIM prépayée locale.',
      'australiaConnectedDetails':
          'Telstra offre la meilleure couverture dans les zones rurales comme le mont Tamborine. Vous pouvez acheter une SIM prépayée à l’aéroport ou dans une supérette.',
      'australiaConnectedAction': 'Visiter le site Telstra',
      'australiaTransportTitle': 'Se déplacer',
      'australiaTransportSummary': 'Transports publics et location de voiture.',
      'australiaTransportDetails':
          'Transports publics : utilisez TransLink pour les horaires bus/train dans le Queensland.\nLocation de voiture : nous recommandons de réserver à l’aéroport de Brisbane (BNE) via Avis, Hertz ou Europcar.',
      'australiaTransportLinkLabel': 'TransLink',
      'contactPageTitle': 'Contacts',
      'contactHeading': 'Nous contacter',
      'contactEmail': 'Email',
      'mapPlaceholder': 'Carte (bientôt disponible)',
      'languageFr': 'Français',
      'languageEn': 'English',
      'homeCta': 'Découvrir le programme',
      // Titre utilisé pour le card de carte sur la page Programme
      'mapTitle': 'Emplacement',
      'venueCopyAddress': 'Copier',
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
      'homeDate': 'August 1st, 2026',
      'homeWelcome': 'Welcome to our wedding website!',
      'homeIntro':
          'We are delighted to share this wonderful day with you. We will get married on 1 August 2026 at Pethers Rainforest Retreat on Mount Tamborine, near Brisbane. On this site you will find all the information you need to prepare your visit and enjoy every moment.',
      'homeAustraliaDescription':
          'Visa, customs, safety, and mobile tips to help you plan your trip.',
      'homeContactsTitle': 'Contacts',
      'homeContactsDescription':
          'Get in touch with us and find all contact details.',
      'venuePageTitle': 'Programme',
      'venueHeading': 'Getting to the Venue',
      'venueDescription':
          'Everything you need to reach Pethers Rainforest Retreat and plan your journey.',
      'venueSubtext':
          'The ceremony and reception will be held on August 1st, 2026 at Pethers Rainforest Retreat.',
      'venueAddressLabel': 'Address',
      'venueAddressValue': '28B Geissmann St, Tamborine Mountain QLD 4272',
      'venueAccessHeading': 'Access',
      'venueAccessCar':
          'By Car: 1hr drive from Brisbane via M1 and Mount Tamborine Rd.',
      'venueAccessPlane':
          'From Airport: 1h15 drive. Car rental highly recommended.',
      'venueAccessTrain':
          'Public Transport: Train to Beenleigh station, then a 45min Taxi/Uber to the mountain.',
      'venueAccessShuttle':
          'Shuttles: Private shuttles available from Brisbane/Gold Coast.',
      'venueProgramHeading': 'Programme of the day',
      'venueProgram1': 'Guests arrive',
      'venueProgram2': 'Ceremony',
      'venueProgram3': 'Cocktail',
      'venueProgram4': 'Dinner',
      'venueProgram5': 'Dance party',
      'australiaPageTitle': 'Travelling to Australia',
      'australiaVisaTitle': 'Tourist Visa (eVisitor)',
      'australiaVisaSummary': 'Free for European citizens. Valid for 3 months.',
      'australiaVisaDetailsIntro':
          'Most European passport holders need an ',
      'australiaVisaDetailsHighlight': 'eVisitor (Subclass 651)',
      'australiaVisaDetailsOutro':
          '. It is completely free and allows you to stay for up to 3 months. Don\'t pay for third-party agencies!',
      'australiaVisaAction': 'Apply on Official Govt Site',
      'australiaRoadTitle': 'On the Road',
      'australiaRoadSummary': 'We drive on the LEFT. Strict speed limits.',
      'australiaRoadDetails':
          'Keep left! Speed cameras are everywhere and tolerance is low. Your domestic license is usually valid if it\'s in English, otherwise carry an International Driving Permit.',
      'australiaCustomsTitle': 'Customs & Borders',
      'australiaCustomsSummary': 'Strict rules on food and organic items.',
      'australiaCustomsDetails':
          'Australia has the strictest biosecurity in the world. You must DECLARE all food, wood, or plant materials on your incoming passenger card. If in doubt, declare it.',
      'australiaCustomsAction': 'Check what you can bring',
      'australiaSafetyTitle': 'Safety & Assistance',
      'australiaSafetySummary': 'Important numbers for your stay.',
      'australiaSafetyDetails':
          'Emergencies (Police/Fire/Ambulance): 000\nNon-emergency Police: 131 444\nRoadside Assistance (RACQ): 13 19 05\nState Emergency Service (SES): 132 500',
      'australiaConnectedTitle': 'Staying Connected',
      'australiaConnectedSummary': 'Get a local prepaid SIM card.',
      'australiaConnectedDetails':
          'Telstra offers the best coverage in rural areas like Tamborine Mountain. You can buy a prepaid SIM at the airport or any convenience store.',
      'australiaConnectedAction': 'Visit Telstra Site',
      'australiaTransportTitle': 'Getting Around',
      'australiaTransportSummary': 'Public transport and car rentals.',
      'australiaTransportDetails':
          'Public Transport: Use TransLink for bus/train schedules in QLD.\nCar Rentals: We recommend booking at Brisbane Airport (BNE) via Avis, Hertz, or Europcar.',
      'australiaTransportLinkLabel': 'TransLink',
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
      'contactEmail': 'Email',
      'mapPlaceholder': 'Map (coming soon)',
      'languageFr': 'Français',
      'languageEn': 'English',
      'homeCta': 'Discover the programme',
      'mapTitle': 'Location',
      'venueCopyAddress': 'Copy',
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
