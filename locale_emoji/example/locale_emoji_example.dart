import 'package:locale_emoji/locale_emoji.dart' as le;

void main() {
  print(le.getFlagEmoji(languageCode: 'de')); // '🇩🇪'
  print(le.getFlagEmoji(languageCode: 'de', countryCode: 'DE')); // '🇩🇪'
  print(le.getFlagEmoji(languageCode: 'de', countryCode: 'CH')); // '🇨🇭'
  print(le.getFlagEmoji(languageCode: 'en')); // '🇺🇸'
  print(le.getFlagEmoji(languageCode: 'en', countryCode: 'US')); // '🇺🇸'
  print(le.getFlagEmoji(languageCode: 'pt')); // '🇧🇷'
  print(le.getFlagEmoji(languageCode: 'zh')); // '🇨🇳'
  print(le.getFlagEmoji(languageCode: 'zh', countryCode: 'TW')); // '🇹🇼'
}
