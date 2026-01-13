import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/widgets.dart';

const String _mapViewType = 'venue-map-embed';
bool _mapRegistered = false;

Widget venueMapEmbed(String mapUrl) {
  if (!_mapRegistered) {
    ui.platformViewRegistry.registerViewFactory(
      _mapViewType,
      (int viewId) => html.IFrameElement()
        ..src = mapUrl
        ..style.border = '0'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.borderRadius = '16px'
        ..setAttribute('loading', 'lazy'),
    );
    _mapRegistered = true;
  }

  return const HtmlElementView(viewType: _mapViewType);
}
