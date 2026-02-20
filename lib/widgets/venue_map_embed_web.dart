import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;

import 'package:flutter/widgets.dart';

const String _mapViewType = 'venue-map-embed';
bool _mapRegistered = false;

Widget venueMapEmbed(String mapUrl) {
  if (!_mapRegistered) {
    ui.platformViewRegistry.registerViewFactory(_mapViewType, (int viewId) {
      final iframe = web.HTMLIFrameElement();
      iframe.src = mapUrl;
      iframe.style.border = '0';
      iframe.style.width = '100%';
      iframe.style.height = '100%';
      iframe.style.borderRadius = '16px';
      iframe.setAttribute('loading', 'lazy');
      return iframe;
    });
    _mapRegistered = true;
  }

  return const HtmlElementView(viewType: _mapViewType);
}
