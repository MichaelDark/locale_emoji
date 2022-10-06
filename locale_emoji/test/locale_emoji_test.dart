import 'package:locale_emoji/locale_emoji.dart';
import 'package:test/test.dart';

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
    test('#23', () => _test('🇺🇦', code: 'UA'));
    test('#24', () => _test('🇺🇦', code: 'ua'));
  });
}

void _test(
  String? expected, {
  String? lang,
  String? script,
  String? code,
}) {
  expect(
    getFlagEmoji(
      languageCode: lang,
      scriptCode: script,
      countryCode: code,
    ),
    equals(expected),
    reason: '[$lang, $script, $code] should match $expected',
  );
}
