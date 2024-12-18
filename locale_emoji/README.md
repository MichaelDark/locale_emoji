# 🏳️ Locale Emoji 🏴

[![pub package](https://img.shields.io/pub/v/locale_emoji.svg)](https://pub.dev/packages/locale_emoji)

Convert 🌍 Locale (language code, script code and country code) to the corresponding 🏳️ Emoji Flag 🏴.  
Inspired from the [JS locale-emoji](https://github.com/10xjs/locale-emoji) package.  

## Features

- 🚀 Written in pure dart
- 🎈 NO dependencies
- 📱 Flutter package for `Locale` extension ([locale_emoji_flutter](https://pub.dev/packages/locale_emoji_flutter))
- ✨ Safe to use as much as it could be

## Usage

```dart
import 'package:locale_emoji/locale_emoji.dart' as le;

//...

final flagDe = le.getFlagEmoji(countryCode: 'DE'); // 🇩🇪
final flagDe = le.getFlagEmoji(languageCode: 'de'); // 🇩🇪

final flagSk = le.getFlagEmoji(languageCode: 'sk'); // 🇸🇰
final flagSk = le.getFlagEmoji(countryCode: 'SK'); // 🇸🇰
final flagSk = le.getFlagEmoji(languageCode: 'sk', scriptCode: 'Latin', countryCode: 'SK'); // 🇸🇰
```

### Flutter

For flutter, use [locale_emoji_flutter](https://pub.dev/packages/locale_emoji_flutter) package instead.

```dart
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

//...

final Locale localeDe = Locale('de');
final Locale localeSk = Locale.fromSubtags(
  languageCode: 'sk',
  scriptCode: 'Latin',
  countryCode: 'SK',
);

final flagDe = localeDe.flagEmoji; // 🇩🇪
final flagSk = localeSk.flagEmoji; // 🇸🇰
```

## Additional information

Defaults might be updated in the origin: [`cldr-json`](https://github.com/unicode-org/cldr-json).
In case of any updates in `cldr-json`, please, run the following command in the root of the repository and submit a PR.

```console
dart tool/update_defaults.dart
```

## Support

<a href="https://www.buymeacoffee.com/michaeldark" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
