// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

void main() {
  const Locale locale = Locale('en', 'GB');
  print(locale.flagEmoji); // 'π¬π§'

  print(const Locale('de').flagEmoji); // 'π©πͺ'
  print(const Locale('de', 'DE').flagEmoji); // 'π©πͺ'
  print(const Locale('de', 'CH').flagEmoji); // 'π¨π­'
  print(const Locale('en').flagEmoji); // 'πΊπΈ'
  print(const Locale('en', 'US').flagEmoji); // 'πΊπΈ'
  print(const Locale('pt').flagEmoji); // 'π§π·'
  print(const Locale('zh').flagEmoji); // 'π¨π³'
  print(const Locale('zh', 'TW').flagEmoji); // 'πΉπΌ'
}
