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
      'no': 'No',
      'yes': 'Yes',
      'newGame': 'New Game',
      'createBoard': 'Create a Board',
      'howToPlay': 'How to Play',
      'howToPlay2': "1. Click on a square and it turns blue.\n"
          "2. Click on a number at the bottom of the screen to assign that number to the selected square.\n"
          "3. You can color a square in three ways:\n"
          "   - White (Standard)\n"
          "   - Yellow (Unsure)\n"
          "   - Green (Definitely correct)\n"
          "4. Press the lightbulb icon to show all incorrect squares if you are stuck.",
      'sodukuRules': 'Soduku Rules',
      'sodukuRules2': "Sudoku is a logic-based number puzzle. The objective is to fill a 9x9 grid with digits so that each column, each row, and each of the nine 3x3 subgrids that compose the grid contain all of the digits from 1 to 9. Each puzzle normally has a unique solution and no math is required to solve it. Just pure logic and deduction.",
      'clearBoard': 'Clear the board?',
      'clearBoard2': 'Are you sure you want to remove all your values on the board?',
      'selectDifficulty' : "Select Difficulty",
      'selectDifficulty2': 'Please select a difficulty',
      'saveSuccess': 'Board saved successfully',
      'saveFailed': 'Invalid squares present. Fix them first.',
      'easy': 'Easy',
      'medium': 'Medium',
      'hard': 'Hard',
      'saveBoard': 'Save Board',
      'cannotChange' : 'Could not change the value',
      'noSelectedSquare' : 'No square selected',
      'solveTitle': 'Sodukoid!',
      'success' : 'You did it!',
      'success2' : 'Congratulations on solving the Sudoku puzzle!',
      'backToHome': 'Back to Home',
    },
    'no': {
      'no': 'Nei',
      'yes': 'Ja',
      'newGame': 'Nytt spill',
      'createBoard': 'Lag et brett',
      'howToPlay': 'Hvordan spille',
      'howToPlay2': "1. Klikk på et felt og det blir blått.\n"
          "2. Klikk på et nummer nederst på skjermen for å tildele det nummeret til det valgte feltet.\n"
          "3. Du kan fargelegge et felt på tre måter:\n"
          "   - Hvit (Standard)\n"
          "   - Gul (Usikker)\n"
          "   - Grønn (Garantert Riktig)\n"
          "4. Trykk på lyspæreikonet for å vise alle feil felter hvis du sitter fast.",
      'sodukuRules': 'Sudoku-regler',
      'sodukuRules2': "Sudoku er et logikkbasert tallpuslespill. Målet er å fylle et 9x9 rutenett med sifre slik at hver kolonne, hver rad og hver av de ni 3x3 delrutene som utgjør rutenettet inneholder alle sifrene fra 1 til 9. Hvert puslespill har valigvist en unik løsning, og det kreves ingen matte for å løse det. Bare ren logikk og deduksjon.",
      'clearBoard': 'Tøm brettet?',
      'clearBoard2': 'Er du sikker på at du vil fjerne alle verdiene på brettet ditt?',
      'selectDifficulty': 'Velg vanskelighetsgrad',
      'selectDifficulty2' : "Velg vanskelighetsgrad",
      'saveSuccess': 'Brettet ble lagret uten problemer',
      'saveFailed': 'Ugyldige ruter eksisterer. Rett dem først.',
      'easy': 'Lett',
      'medium': 'Middels',
      'hard': 'Vanskelig',
      'saveBoard': 'Lagre brett',
      'cannotChange' : 'Kunne ikke endre verdien',
      'noSelectedSquare' : 'Ingen valgt rute',
      'solveTitle': 'Sodukoid!',
      'success' : 'Du klarte det!',
      'success2' : 'Gratulerer med å ha fullført soduku brettet!',
      'backToHome': 'Gå Hjem',
    },
  };
}
