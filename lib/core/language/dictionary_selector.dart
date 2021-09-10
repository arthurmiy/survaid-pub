import 'package:capimobile/core/language/english_dictionary.dart';
import 'package:capimobile/core/language/language_dictionary.dart';
import 'package:capimobile/core/language/portuguese_dictionary.dart';

class DictionarySelector {
  static LanguageDictionary getDictionaryByLanguage(String language) {
    switch (language) {
      case 'pt':
        return PortugueseDictionary();
        break;
      default:
        return EnglishDictionary();
        break;
    }
  }
}
