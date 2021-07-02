import 'package:flutter/cupertino.dart';

class GlobalConstant {
  
  static Color mainBack = Color(0xff090b0d);
  static Color mainSoft = Color(0xff730217);
  static Color fontColorLive = Color(0xffF2CB05);
  static Color fontColorAlternative = Color(0xffD94F30);
  static Color alternative = Color(0xff594302);

  static GlobalKey<NavigatorState> navigatorKey;
  static List<Locale> supportedLanguages = [Locale("tr", "TR"), Locale("en", "US")];
  static Locale initialLanguage = Locale("tr", "TR");
  static Locale currentLocale = Locale("tr");
}
