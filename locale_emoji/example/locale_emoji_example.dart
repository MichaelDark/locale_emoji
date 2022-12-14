import 'package:locale_emoji/locale_emoji.dart' as le;

void main() {
  print(le.getFlagEmoji(languageCode: 'de')); // 'π©πͺ'
  print(le.getFlagEmoji(languageCode: 'de', countryCode: 'DE')); // 'π©πͺ'
  print(le.getFlagEmoji(languageCode: 'de', countryCode: 'CH')); // 'π¨π­'
  print(le.getFlagEmoji(languageCode: 'en')); // 'πΊπΈ'
  print(le.getFlagEmoji(languageCode: 'en', countryCode: 'US')); // 'πΊπΈ'
  print(le.getFlagEmoji(languageCode: 'pt')); // 'π§π·'
  print(le.getFlagEmoji(languageCode: 'zh')); // 'π¨π³'
  print(le.getFlagEmoji(languageCode: 'zh', countryCode: 'TW')); // 'πΉπΌ'
}
