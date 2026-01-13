import 'package:flutter/widgets.dart';

import 'venue_map_embed_stub.dart'
    if (dart.library.html) 'venue_map_embed_web.dart';

Widget buildVenueMapEmbed(String mapUrl) {
  return venueMapEmbed(mapUrl);
}
