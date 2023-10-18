import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String _language = "en"; // English is our default language

  String get language => _language;

  void setLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }

  String get(String key) {
    return _localizedValues[_language]![key]!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'newGame': 'New Game',
      'createBoard': 'Create a Board',
      'howToPlay': 'How to Play',

    },
    'no': {
      'newGame': 'Start et spill',
      'createBoard': 'Lag et nytt brett',
      'howToPlay': 'Hvordan spiller du',
    },
  };
}
