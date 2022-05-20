import 'dart:async';
import 'package:flutter/widgets.dart';
import 'localizations.dart';

class APPLocalizationsDelegate extends LocalizationsDelegate<APPLocalizations> {
  const APPLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<APPLocalizations> load(Locale locale) {
    return APPLocalizations.load(locale);
  }

  @override
  bool shouldReload(APPLocalizationsDelegate old) => false;
}