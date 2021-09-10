import 'package:capimobile/core/language/language_dictionary.dart';
import 'package:shared_preferences/shared_preferences.dart';

String currentLanguage;
LanguageDictionary d;

class LanguageList {
  static final List<String> languageList = ['en', 'pt'];

  static final languageDisplayInfo = {
    'en': DisplayInfo('ENG-US', 'icons/flags/png/us.png'),
    'pt': DisplayInfo('PT-BR', 'icons/flags/png/br.png')
  };
}

class DisplayInfo {
  final String text;
  final String iconPath;

  DisplayInfo(this.text, this.iconPath);

  String toString() {
    return this.text;
  }

  String get icon => this.iconPath;
}

Future<String> retrieveSavedLang(String tag) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(tag) ?? '';
}

void saveLang(String tag, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(tag, value);
}
