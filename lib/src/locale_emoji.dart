import 'package:locale_emoji/src/utils.dart';

import 'defaults.dart';

const _flagOffset = 0x1F1E6 - 0x41;

String? getFlagEmoji(
  String languageCode, {
  String? scriptCode,
  String? countryCode,
}) {
  final String language;
  if (scriptCode != null && scriptCode.isNotEmpty) {
    language = '${languageCode.toLowerCase()}-${scriptCode.capitalized()}';
  } else {
    language = languageCode.toLowerCase();
  }

  String? country = countryCode?.toUpperCase();

  if (country == null || !RegExp(r"^[A-Z]{2}$").hasMatch(country)) {
    country = languageCodeToCountryCode[language];
  }

  if (country == null) {
    return null;
  }

  final a = String.fromCharCode(country.runes.first + _flagOffset);
  final b = String.fromCharCode(country.runes.last + _flagOffset);
  return a + b;
}
