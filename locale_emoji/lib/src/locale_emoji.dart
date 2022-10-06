import 'defaults.dart';
import 'utils.dart';

/// We can receive the UTF-16 code index from the character using [String.runes].
/// The UTF-16 A is positioned at 65 (0x41),
/// and we have subtracted this from the region A character index 127462 (0x1F1E6):
///
/// To get the correct flag emoji index, we simply add the received index to the offset number.
///
/// Notes:
/// 127462 == 0x1F1E6
///     65 == 0x41
/// 127397 == 0x1F1A
const _offset = 0x1F1E6 - 0x41;

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

  return String.fromCharCode(country.codeUnitAt(0) + _offset) +
      String.fromCharCode(country.codeUnitAt(1) + _offset);
}
