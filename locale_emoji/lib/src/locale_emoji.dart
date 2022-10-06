import 'defaults.dart';
import 'utils.dart';

/// We can receive the UTF-16 code index from the character using [String.runes].
/// The UTF-16 A is positioned at 65 (0x41),
/// and we have subtracted this from the region A character index 127462 (0x1F1E6):
///
/// 127462 (0x1F1E6) - 65 (0x41) //= 127397 (0x1F1A5)
///
/// To get the correct flag emoji index, we simply add the received index to the offset number.
const _flagOffset = 0x1F1E6 - 0x41;

/// Get Flag Emoji from the locale information.
///
/// Casing of input parameters is can by any (lower, UPPER, mIxEd).
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
