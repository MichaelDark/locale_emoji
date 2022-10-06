import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// Raw file for https://github.com/unicode-cldr/cldr-core/blob/master/supplemental/likelySubtags.json
const subtagsJsonUrl =
    'https://raw.githubusercontent.com/unicode-cldr/cldr-core/master/supplemental/likelySubtags.json';

void main() async {
  final subtagsJsonResponse = await http.get(Uri.parse(subtagsJsonUrl));
  if (subtagsJsonResponse.statusCode != 200) {
    throw 'Cannot write results: file not found';
  }
  final subtagsJson = json.decode(subtagsJsonResponse.body);
  final likelySubtags = subtagsJson['supplemental']!['likelySubtags'] as Map;
  String defaultsCode = '';

  for (final key in likelySubtags.keys) {
    if (key is! String) {
      continue;
    }
    if (key.indexOf('und-') == 0 || RegExp(r"-[A-Z]{2}$").hasMatch(key)) {
      continue;
    }
    var locale = likelySubtags[key];
    if (locale is! String) {
      continue;
    }

    final localeSplit = locale.toUpperCase().split(RegExp(r"[-|_]"));
    if (localeSplit.length < 2) {
      continue;
    }

    var code = localeSplit.last;
    if (code.isEmpty || code == 'ZZ' || !RegExp(r"^[A-Z]{2}$").hasMatch(code)) {
      continue;
    }

    defaultsCode += "  '$key': '$code',\n";
  }

  final file = File("lib/src/defaults.dart");
  if (!file.existsSync()) {
    throw 'Cannot write results: file not found';
  }
  final content = file.readAsStringSync().replaceAll(
        RegExp(r"// --- DEFAULTS START ---\n((.|\n)+)// --- DEFAULTS END ---"),
        "// --- DEFAULTS START ---\n$defaultsCode  // --- DEFAULTS END ---",
      );
  file.writeAsString(content);
}
