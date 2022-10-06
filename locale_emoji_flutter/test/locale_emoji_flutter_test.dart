import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

void main() {
  group('FlagEmojiLocaleExt#flagEmoji', () {
    Map<Locale, String?> localeToFlagTestMap = {
      const Locale('de'): '🇩🇪',
      const Locale('de', 'DE'): '🇩🇪',
      const Locale('de', 'CH'): '🇨🇭',
      const Locale('en'): '🇺🇸',
      const Locale('EN'): '🇺🇸',
      const Locale('en', 'GB'): '🇬🇧',
      const Locale('en', 'US'): '🇺🇸',
      const Locale('EN', 'US'): '🇺🇸',
      const Locale('EN', 'us'): '🇺🇸',
      const Locale('en', 'us'): '🇺🇸',
      const Locale('pt'): '🇧🇷',
      const Locale.fromSubtags(
        languageCode: 'sk',
        scriptCode: 'Latin',
        countryCode: 'SK',
      ): '🇸🇰',
      const Locale('eo'): null,
      const Locale('zh'): '🇨🇳',
      const Locale('zh', 'TW'): '🇹🇼',
      const Locale('zh', 'tw'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Bopo'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hanb'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'BOPO'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'HANB'): '🇹🇼',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'HANT'): '🇹🇼',
      const Locale('rubbish'): null,
    };

    for (final locale in localeToFlagTestMap.keys) {
      String from = locale.toLanguageTag();
      String? to = localeToFlagTestMap[locale];

      test('$from -> $to', () {
        expect(
          locale.flagEmoji,
          equals(to),
          reason: '${locale.toLanguageTag()} should match $to',
        );
      });
    }
  });
}
