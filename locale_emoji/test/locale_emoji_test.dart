import 'package:locale_emoji/locale_emoji.dart';
import 'package:test/test.dart';

void main() {
  group('getEmojiFlag', () {
    Map<EmojiFlagTestCase, String?> testCases = {
      const EmojiFlagTestCase('de'): '🇩🇪',
      const EmojiFlagTestCase('de', countryCode: 'DE'): '🇩🇪',
      const EmojiFlagTestCase('de', countryCode: 'CH'): '🇨🇭',
      const EmojiFlagTestCase('en'): '🇺🇸',
      const EmojiFlagTestCase('EN'): '🇺🇸',
      const EmojiFlagTestCase('en', countryCode: 'GB'): '🇬🇧',
      const EmojiFlagTestCase('en', countryCode: 'US'): '🇺🇸',
      const EmojiFlagTestCase('EN', countryCode: 'US'): '🇺🇸',
      const EmojiFlagTestCase('EN', countryCode: 'us'): '🇺🇸',
      const EmojiFlagTestCase('en', countryCode: 'us'): '🇺🇸',
      const EmojiFlagTestCase('pt'): '🇧🇷',
      const EmojiFlagTestCase('sk', scriptCode: 'Latin', countryCode: 'SK'):
          '🇸🇰',
      const EmojiFlagTestCase('eo'): null,
      const EmojiFlagTestCase('zh'): '🇨🇳',
      const EmojiFlagTestCase('zh', countryCode: 'TW'): '🇹🇼',
      const EmojiFlagTestCase('zh', countryCode: 'tw'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'Bopo'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'Hanb'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'Hant'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'BOPO'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'HANB'): '🇹🇼',
      const EmojiFlagTestCase('zh', scriptCode: 'HANT'): '🇹🇼',
      const EmojiFlagTestCase('rubbish'): null,
    };

    for (final testCase in testCases.keys) {
      String from = testCase.toLanguageTag();
      String? to = testCases[testCase];

      test('$from -> $to', () {
        expect(
          getFlagEmoji(
            testCase.languageCode,
            scriptCode: testCase.scriptCode,
            countryCode: testCase.countryCode,
          ),
          equals(to),
          reason: '${testCase.toLanguageTag()} should match $to',
        );
      });
    }
  });
}

class EmojiFlagTestCase {
  final String languageCode;
  final String? scriptCode;
  final String? countryCode;

  const EmojiFlagTestCase(this.languageCode,
      {this.scriptCode, this.countryCode});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmojiFlagTestCase && other.hashCode == hashCode;
  }

  @override
  int get hashCode =>
      languageCode.hashCode ^ scriptCode.hashCode ^ countryCode.hashCode;

  /// From [Locale] from `dart:ui`
  ///
  /// Returns a syntactically valid Unicode BCP47 Locale Identifier.
  ///
  /// Some examples of such identifiers: "en", "es-419", "hi-Deva-IN" and
  /// "zh-Hans-CN". See http://www.unicode.org/reports/tr35/ for technical
  /// details.
  String toLanguageTag() => _rawToString('-');

  String _rawToString(String separator) {
    final StringBuffer out = StringBuffer(languageCode);
    if (scriptCode != null && scriptCode!.isNotEmpty) {
      out.write('$separator$scriptCode');
    }
    if (countryCode != null && countryCode!.isNotEmpty) {
      out.write('$separator$countryCode');
    }
    return out.toString();
  }
}
