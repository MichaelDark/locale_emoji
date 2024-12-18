import 'package:locale_emoji/locale_emoji.dart';
import 'package:test/test.dart';

void main() {
  group('getEmojiFlag', () {
    test('Deutsch', () {
      _test('🇩🇪', lang: 'de');
      _test('🇩🇪', lang: 'de', code: 'DE');
      _test('🇨🇭', lang: 'de', code: 'CH');
    });

    test('English', () {
      _test('🇺🇸', lang: 'en');
      _test('🇬🇧', lang: 'en', code: 'GB');
      _test('🇺🇸', lang: 'en', code: 'US');
    });

    test('Others', () {
      _test(null, lang: 'rubbish');
      _test('🇧🇷', lang: 'pt', code: 'BR');
      _test('🇵🇹', lang: 'pt', code: 'PT');
      _test('🇸🇰', lang: 'sk', script: 'Latin', code: 'SK');
      _test('🇺🇦', code: 'ua');
    });
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
