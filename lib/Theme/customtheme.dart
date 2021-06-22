/*import 'package:ir_app/Utils/Utils.dart';
import '../Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme =>
      !_isDarkTheme ? ThemeMode.light : ThemeMode.dark;
  static bool isDark() => _isDarkTheme;
  void setDarkTheme(bool val) {
    _isDarkTheme = val;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    setValueForKey(_isDarkTheme.toString(), "themeDark");
    notifyListeners();
  }

  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //appBarTheme: AppBarTheme(backgroundColor: white_background),
        //2
        accentColor: white_background,
        primaryColor: primary_background_one,
        scaffoldBackgroundColor: white_background,
        backgroundColor: orange_text,
        //fontFamily: 'Montserrat', //3
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary_background_card_two,
        ),
        dividerTheme: DividerThemeData(color: black_background),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: white_background,
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: grey_background),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: black_background,
            primary: white_background,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: light_grey_background,
            primary: grey_background,
          ),
        ),
        textTheme: ThemeData.light().textTheme,
        primaryTextTheme: TextTheme(
            headline1: TextStyle(fontSize: 14, color: primary_splash),
            headline2: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            headline3: TextStyle(
              color: Colors.orange,
            ),
            headline4: TextStyle(color: Colors.black, fontSize: 22),
            caption: TextStyle(fontSize: 14, color: Colors.black),
            bodyText2: TextStyle(fontSize: 18, color: Colors.grey)),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          buttonColor: primary_button,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        //appBarTheme: AppBarTheme(backgroundColor: dark_blue_background),
        brightness: Brightness.dark,
        accentColor: dark_blue_background,
        cardTheme: CardTheme(color: Colors.yellow),
        primaryColor: light_blue_background,
        backgroundColor: orange_text,
        //appBarTheme: AppBarTheme(: light_blue_background),
        scaffoldBackgroundColor: dark_blue_background,
        textTheme: ThemeData.dark().textTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary_background_card_one,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: dark_blue_background,
          labelStyle: TextStyle(color: Colors.white),
        ),
        dividerTheme: DividerThemeData(color: white_background),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: dark_blue_background,
          ),
        ),
        tabBarTheme: TabBarTheme(
            labelColor: white_text, unselectedLabelColor: grey_text),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: light_blue_background,
            primary: white_background,
          ),
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(fontSize: 14, color: primary_splash),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          headline3: TextStyle(
            color: orange_text,
            fontSize: 25,
          ),
          bodyText2: TextStyle(fontSize: 18, color: Colors.grey),
          caption: TextStyle(fontSize: 14, color: Colors.white),
          headline4: TextStyle(color: Colors.white, fontSize: 22),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          buttonColor: primary_button,
        ));
  }
}
*/