// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

void main() {
  const Locale locale = Locale('en', 'GB');
  print(locale.flagEmoji); // '🇬🇧'

  print(const Locale('de').flagEmoji); // '🇩🇪'
  print(const Locale('de', 'DE').flagEmoji); // '🇩🇪'
  print(const Locale('de', 'CH').flagEmoji); // '🇨🇭'
  print(const Locale('en').flagEmoji); // '🇺🇸'
  print(const Locale('en', 'US').flagEmoji); // '🇺🇸'
  print(const Locale('pt').flagEmoji); // '🇧🇷'
  print(const Locale('zh').flagEmoji); // '🇨🇳'
  print(const Locale('zh', 'TW').flagEmoji); // '🇹🇼'
}
