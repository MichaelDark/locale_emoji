import 'package:locale_emoji/locale_emoji.dart' as le;

void main() {
  print('de outputs 🇩🇪: ${le.getFlagEmoji('de')}');
  print('en outputs 🇺🇸: ${le.getFlagEmoji('en')}');
  print('EN outputs 🇺🇸: ${le.getFlagEmoji('EN')}');
  print('pt outputs 🇧🇷: ${le.getFlagEmoji('pt')}');
  print('zh outputs 🇨🇳: ${le.getFlagEmoji('zh')}');
  print('de-DE outputs 🇩🇪: ${le.getFlagEmoji('de', countryCode: 'DE')}');
  print('de-DE outputs 🇩🇪: ${le.getFlagEmoji('de', countryCode: 'DE')}');
  print('de-CH outputs 🇨🇭: ${le.getFlagEmoji('de', countryCode: 'CH')}');
  print('en-GB outputs 🇬🇧: ${le.getFlagEmoji('en', countryCode: 'GB')}');
  print('en-US outputs 🇺🇸: ${le.getFlagEmoji('en', countryCode: 'US')}');
  print('EN-US outputs 🇺🇸: ${le.getFlagEmoji('EN', countryCode: 'US')}');
  print('EN-us outputs 🇺🇸: ${le.getFlagEmoji('EN', countryCode: 'us')}');
  print('en-us outputs 🇺🇸: ${le.getFlagEmoji('en', countryCode: 'us')}');
  print('zh-TW outputs 🇹🇼: ${le.getFlagEmoji('zh', countryCode: 'TW')}');
  print('zh-tw outputs 🇹🇼: ${le.getFlagEmoji('zh', countryCode: 'tw')}');
  print('zh-Bopo outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'Bopo')}');
  print('zh-Hanb outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'Hanb')}');
  print('zh-Hant outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'Hant')}');
  print('zh-BOPO outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'BOPO')}');
  print('zh-HANB outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'HANB')}');
  print('zh-HANT outputs 🇹🇼: ${le.getFlagEmoji('zh', scriptCode: 'HANT')}');
  print('eo outputs null: ${le.getFlagEmoji('eo')}');
  print('rubbish outputs null: ${le.getFlagEmoji('rubbish')}');
  print(
    'sk-Latin-SK outputs 🇸🇰: ${le.getFlagEmoji('sk', scriptCode: 'Latin', countryCode: 'SK')}',
  );
}
