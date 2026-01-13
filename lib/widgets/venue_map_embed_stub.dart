import 'package:flutter/material.dart';

Widget venueMapEmbed(String mapUrl) {
  return Center(
    child: Text(
      mapUrl,
      style: const TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    ),
  );
}
