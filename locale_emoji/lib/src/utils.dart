extension StringExtension on String {
  /// Used only to capitalize script code.
  String? capitalized() {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
