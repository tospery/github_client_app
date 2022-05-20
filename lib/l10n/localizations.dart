import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'messages_all.dart';

class APPLocalizations {
  static Future<APPLocalizations> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty ?? true
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return APPLocalizations();
    });
  }

  static APPLocalizations of(BuildContext context) {
    return Localizations.of<APPLocalizations>(context, APPLocalizations)!;
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

    String get noDescription {
    return Intl.message(
      'no Description',
      name: 'noDescription',
      desc: 'no Description for the Demo application',
    );
  }

}