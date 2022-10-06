import 'package:locale_emoji/locale_emoji.dart';
import 'package:test/test.dart';

void main() {
  group('getEmojiFlag', () {
    Map<EmojiFlagTestCase, String?> testCases = {
      EmojiFlagTestCase('de'): '🇩🇪',
      EmojiFlagTestCase('de', countryCode: 'DE'): '🇩🇪',
      EmojiFlagTestCase('de', countryCode: 'DE'): '🇩🇪',
      EmojiFlagTestCase('de', countryCode: 'CH'): '🇨🇭',
      EmojiFlagTestCase('en'): '🇺🇸',
      EmojiFlagTestCase('EN'): '🇺🇸',
      EmojiFlagTestCase('en', countryCode: 'GB'): '🇬🇧',
      EmojiFlagTestCase('en', countryCode: 'US'): '🇺🇸',
      EmojiFlagTestCase('EN', countryCode: 'US'): '🇺🇸',
      EmojiFlagTestCase('EN', countryCode: 'us'): '🇺🇸',
      EmojiFlagTestCase('en', countryCode: 'us'): '🇺🇸',
      EmojiFlagTestCase('pt'): '🇧🇷',
      EmojiFlagTestCase('sk', scriptCode: 'Latin', countryCode: 'SK'): '🇸🇰',
      EmojiFlagTestCase('eo'): null,
      EmojiFlagTestCase('zh'): '🇨🇳',
      EmojiFlagTestCase('zh', countryCode: 'TW'): '🇹🇼',
      EmojiFlagTestCase('zh', countryCode: 'tw'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'Bopo'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'Hanb'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'Hant'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'BOPO'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'HANB'): '🇹🇼',
      EmojiFlagTestCase('zh', scriptCode: 'HANT'): '🇹🇼',
      EmojiFlagTestCase('rubbish'): null,
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
