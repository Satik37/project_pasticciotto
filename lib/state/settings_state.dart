import 'package:flutter/material.dart';

class SettingsState with ChangeNotifier {
  String _language = 'English';

  String get language => _language;
  Locale get locale {
    switch (_language) {
      case 'Spanish':
        return Locale('es', 'ES');
      case 'French':
        return Locale('fr', 'FR');
      case 'German':
        return Locale('de', 'DE');
      case 'Italian':
        return Locale('it', 'IT');
      case 'Russian':
        return Locale('ru', 'RU');
      default:
        return Locale('en', 'US');
    }
  }

  void changeLanguage(String newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}
