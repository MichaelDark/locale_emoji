import 'dart:ui' show Locale;

import 'package:locale_emoji/locale_emoji.dart';

extension FlagEmojiLocaleExt on Locale {
  /// Get Flag Emoji from the Locale.
  String? get flagEmoji {
    return getFlagEmoji(
      languageCode,
      scriptCode: scriptCode,
      countryCode: countryCode,
    );
  }
}
