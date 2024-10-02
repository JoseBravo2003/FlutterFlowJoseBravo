import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hinz2oi7': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    '6vqp8yxc': {
      'es': 'Siguiente',
      'en': 'Following',
    },
    'rc1zc5vx': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Pagina2
  {
    'yzijdl4w': {
      'es': 'Lancer Evolutions X',
      'en': 'Lancer Evolutions X',
    },
    '33gbbbbc': {
      'es': 'Regresar',
      'en': 'Go back',
    },
    'wp7a3tb9': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'h30yiy59': {
      'es': 'This app needs the bluethooth access to connect with devices',
      'en': '',
    },
    '3ly45m2z': {
      'es': '',
      'en': '',
    },
    '3f8lteyj': {
      'es': '',
      'en': '',
    },
    'fstbmigq': {
      'es': '',
      'en': '',
    },
    'm1ysz3f0': {
      'es': '',
      'en': '',
    },
    'kv9zrrev': {
      'es': '',
      'en': '',
    },
    '0oempzl9': {
      'es': '',
      'en': '',
    },
    '8rajg8fg': {
      'es': '',
      'en': '',
    },
    'qk9fr0aa': {
      'es': '',
      'en': '',
    },
    '18s6a6hi': {
      'es': '',
      'en': '',
    },
    'ypbmosfg': {
      'es': '',
      'en': '',
    },
    '5md2a475': {
      'es': '',
      'en': '',
    },
    'lb7s1810': {
      'es': '',
      'en': '',
    },
    'b1y8wb5o': {
      'es': '',
      'en': '',
    },
    'gjxozsan': {
      'es': '',
      'en': '',
    },
    'c11a7wov': {
      'es': '',
      'en': '',
    },
    '964gvdr4': {
      'es': '',
      'en': '',
    },
    'a9c4cznn': {
      'es': '',
      'en': '',
    },
    '66ick4wf': {
      'es': '',
      'en': '',
    },
    'rnew81i5': {
      'es': '',
      'en': '',
    },
    '3qhrfkz6': {
      'es': '',
      'en': '',
    },
    'ym097xvz': {
      'es': '',
      'en': '',
    },
    'y2owifen': {
      'es': '',
      'en': '',
    },
    'q9qi5og4': {
      'es': '',
      'en': '',
    },
    'o1041qiy': {
      'es': '',
      'en': '',
    },
    '7nssbvon': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
