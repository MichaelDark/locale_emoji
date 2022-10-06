# Locale Emoji

[![pub package](https://img.shields.io/pub/v/locale_emoji.svg)](https://pub.dev/packages/locale_emoji)

Convert Locale (languageCode, scriptCode and countryCode) to the corresponding Emoji Flag.  
Inspired by [https://github.com/10xjs/locale-emoji](https://github.com/10xjs/locale-emoji)

## Usage

```dart
import 'package:locale_emoji/locale_emoji.dart' as le;

//...

final flagDe = le.getFlagEmoji('de'); // 🇩🇪
final flagSk = le.getFlagEmoji('sk', scriptCode: 'Latin', countryCode: 'SK'); // 🇸🇰
```

## Additional information

Defaults might be updated in the origin: [`cldr-core`](https://github.com/unicode-cldr/cldr-core/blob/master/supplemental/likelySubtags.json).
In case of any updates in `cldr-core`, please, run the following command in the root of the repository and submit a PR.

```console
dart tools/update_defaults.dart
```
