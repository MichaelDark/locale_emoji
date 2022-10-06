import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

void main() {
  group('getEmojiFlag', () {
    test('#01', () => _test('🇩🇪', lang: 'de'));
    test('#02', () => _test('🇩🇪', lang: 'de', code: 'DE'));
    test('#03', () => _test('🇨🇭', lang: 'de', code: 'CH'));
    test('#04', () => _test('🇺🇸', lang: 'en'));
    test('#05', () => _test('🇺🇸', lang: 'EN'));
    test('#06', () => _test('🇬🇧', lang: 'en', code: 'GB'));
    test('#07', () => _test('🇺🇸', lang: 'en', code: 'US'));
    test('#08', () => _test('🇺🇸', lang: 'EN', code: 'US'));
    test('#09', () => _test('🇺🇸', lang: 'EN', code: 'us'));
    test('#10', () => _test('🇺🇸', lang: 'en', code: 'us'));
    test('#11', () => _test('🇧🇷', lang: 'pt'));
    test('#12', () => _test('🇨🇳', lang: 'zh'));
    test('#13', () => _test('🇹🇼', lang: 'zh', code: 'TW'));
    test('#14', () => _test('🇹🇼', lang: 'zh', code: 'tw'));
    test('#15', () => _test('🇹🇼', lang: 'zh', script: 'Bopo'));
    test('#16', () => _test('🇹🇼', lang: 'zh', script: 'Hanb'));
    test('#17', () => _test('🇹🇼', lang: 'zh', script: 'Hant'));
    test('#18', () => _test('🇹🇼', lang: 'zh', script: 'BOPO'));
    test('#19', () => _test('🇹🇼', lang: 'zh', script: 'HANB'));
    test('#20', () => _test('🇹🇼', lang: 'zh', script: 'HANT'));
    test('#21', () => _test(null, lang: 'rubbish'));
    test('#22', () => _test('🇸🇰', lang: 'sk', script: 'Latin', code: 'SK'));
    test(
      '#23',
      () => _test('🇺🇦', lang: '', code: 'UA'),
      skip: 'Cannot initialize Locale with null/empty language code',
    );
    test(
      '#24',
      () => _test('🇺🇦', lang: '', code: 'ua'),
      skip: 'Cannot initialize Locale with null/empty language code',
    );
  });
}

void _test(
  String? expected, {
  required String lang,
  String? script,
  String? code,
}) {
  final locale = script == null
      ? Locale(lang, code)
      : Locale.fromSubtags(
          languageCode: lang,
          scriptCode: script,
          countryCode: code,
        );
  expect(
    locale.flagEmoji,
    equals(expected),
    reason: '[$lang, $script, $code] should match $expected',
  );
}
