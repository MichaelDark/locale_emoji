# π³οΈ Locale Emoji π΄

[![pub package](https://img.shields.io/pub/v/locale_emoji.svg)](https://pub.dev/packages/locale_emoji)

Convert π Locale (language code, script code and country code) to the corresponding π³οΈ Emoji Flag π΄.  
Inspired from the [JS locale-emoji](https://github.com/10xjs/locale-emoji) package.  

## Features

- π Written in pure dart
- π NO dependencies
- π± Flutter package for `Locale` extension ([locale_emoji_flutter](https://pub.dev/packages/locale_emoji_flutter))
- β¨ Safe to use as much as it could be

## Usage

```dart
import 'package:locale_emoji/locale_emoji.dart' as le;

//...

final flagDe = le.getFlagEmoji(countryCode: 'DE'); // π©πͺ
final flagDe = le.getFlagEmoji(languageCode: 'de'); // π©πͺ

final flagSk = le.getFlagEmoji(languageCode: 'sk'); // πΈπ°
final flagSk = le.getFlagEmoji(countryCode: 'SK'); // πΈπ°
final flagSk = le.getFlagEmoji(languageCode: 'sk', scriptCode: 'Latin', countryCode: 'SK'); // πΈπ°
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

final flagDe = localeDe.flagEmoji; // π©πͺ
final flagSk = localeSk.flagEmoji; // πΈπ°
```

## Additional information

Defaults might be updated in the origin: [`cldr-core`](https://github.com/unicode-cldr/cldr-core/blob/master/supplemental/likelySubtags.json).
In case of any updates in `cldr-core`, please, run the following command in the root of the repository and submit a PR.

```console
dart tools/update_defaults.dart
```

## Support

<a href="https://www.buymeacoffee.com/michaeldark" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
