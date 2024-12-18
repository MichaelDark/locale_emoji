## 1.0.0

- Update README
- Update defaults
- Input parameters are no longer normalized:
  - script code is no longer capitalized
  - language code is no longer lowercased

## 0.2.1

- Update README

## 0.2.0

- **BREAKING** Inorder to support getting flag from an actual country code, using `getFlagEmoji(countryCode: 'UA')`, API changed:

```
// Before
getFlagEmoji('', countryCode: 'UA')
String? getFlagEmoji(
  String languageCode, {
  String? scriptCode,
  String? countryCode,
})

// After
getFlagEmoji(countryCode: 'UA')
String? getFlagEmoji({
  String? languageCode,
  String? scriptCode,
  String? countryCode,
})
```

## 0.1.4

- Fix code unit conversion.

## 0.1.3

- Add doc comments.
- Update package description.

## 0.1.2

- Add separate package `locale_emoji_flutter` to ease use in Flutter apps.
- Update tests.
- Update README.md.

## 0.1.1

- Rewrite script, that updates defaults, from JS to Dart.
- Update README.md.

## 0.1.0

- Initial version.
