var fs = require('fs');

var cldr = require('cldr-core/supplemental/likelySubtags.json');
var likelySubtags = cldr.supplemental.likelySubtags;

var defaultsCode = '';

Object.keys(likelySubtags).forEach(key => {
  if (key.indexOf('und-') === 0 || (/-[A-Z]{2}$/g).test(key)) {
    return;
  }

  var locale = likelySubtags[key];

  var split = locale.toUpperCase().split(/-|_/);
  if (split.length < 2) {
    return;
  }

  var code = split.pop();
  if (!code || code === 'ZZ' || !/^[A-Z]{2}$/.test(code)) {
    return;
  }

  defaultsCode += `  '${key}': '${code}',\n`;
});

let path = `${__dirname}/lib/src/defaults.dart`;

let content = fs.readFileSync(path, 'utf-8')
  .replace(/\/\/ --- DEFAULTS START ---\n((.|\n)+)\/\/ --- DEFAULTS END ---/gm,
    `// --- DEFAULTS START ---\n${defaultsCode}// --- DEFAULTS END ---`);

fs.writeFileSync(path, content, 'utf-8');