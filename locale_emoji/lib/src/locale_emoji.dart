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

/// Pattern for country code according to ISO 3166-1 (alpha-2 code)
const _countryPattern = r"^[A-Z]{2}$";

/// Returns Flag Emoji from the locale information.
///
/// Casing of input parameters can be any (i.e. lower, UPPER, mIxEd).
String? getFlagEmoji({
  String? languageCode,
  String? scriptCode,
  String? countryCode,
}) {
  String? country = countryCode?.toUpperCase();

  if (country == null || !RegExp(_countryPattern).hasMatch(country)) {
    country = _countryFromLanguage(languageCode, scriptCode);
  }

  if (country == null) {
    return null;
  }

  return _countryToFlagEmoji(country);
}

/// Determines whether country code can be obtained from language code
String? _countryFromLanguage(String? languageCode, String? scriptCode) {
  if (languageCode == null) return null;

  final language = scriptCode != null && scriptCode.isNotEmpty
      ? '${languageCode.toLowerCase()}-${scriptCode.capitalized()}'
      : languageCode.toLowerCase();

  return languageCodeToCountryCode[language];
}

/// Converts country code to the actual Flag Emoji
String _countryToFlagEmoji(String country) =>
    String.fromCharCode(country.codeUnitAt(0) + _offset) +
    String.fromCharCode(country.codeUnitAt(1) + _offset);
