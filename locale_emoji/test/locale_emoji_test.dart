import 'package:locale_emoji/locale_emoji.dart';
import 'package:test/test.dart';

void main() {
  group('getEmojiFlag', () {
    test('#01', () => _test('π©πͺ', lang: 'de'));
    test('#02', () => _test('π©πͺ', lang: 'de', code: 'DE'));
    test('#03', () => _test('π¨π­', lang: 'de', code: 'CH'));
    test('#04', () => _test('πΊπΈ', lang: 'en'));
    test('#05', () => _test('πΊπΈ', lang: 'EN'));
    test('#06', () => _test('π¬π§', lang: 'en', code: 'GB'));
    test('#07', () => _test('πΊπΈ', lang: 'en', code: 'US'));
    test('#08', () => _test('πΊπΈ', lang: 'EN', code: 'US'));
    test('#09', () => _test('πΊπΈ', lang: 'EN', code: 'us'));
    test('#10', () => _test('πΊπΈ', lang: 'en', code: 'us'));
    test('#11', () => _test('π§π·', lang: 'pt'));
    test('#12', () => _test('π¨π³', lang: 'zh'));
    test('#13', () => _test('πΉπΌ', lang: 'zh', code: 'TW'));
    test('#14', () => _test('πΉπΌ', lang: 'zh', code: 'tw'));
    test('#15', () => _test('πΉπΌ', lang: 'zh', script: 'Bopo'));
    test('#16', () => _test('πΉπΌ', lang: 'zh', script: 'Hanb'));
    test('#17', () => _test('πΉπΌ', lang: 'zh', script: 'Hant'));
    test('#18', () => _test('πΉπΌ', lang: 'zh', script: 'BOPO'));
    test('#19', () => _test('πΉπΌ', lang: 'zh', script: 'HANB'));
    test('#20', () => _test('πΉπΌ', lang: 'zh', script: 'HANT'));
    test('#21', () => _test(null, lang: 'rubbish'));
    test('#22', () => _test('πΈπ°', lang: 'sk', script: 'Latin', code: 'SK'));
    test('#23', () => _test('πΊπ¦', code: 'UA'));
    test('#24', () => _test('πΊπ¦', code: 'ua'));
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
