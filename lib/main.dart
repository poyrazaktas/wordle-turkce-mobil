import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle_turkce/constants/words.dart';
import 'package:wordle_turkce/provider/color_blind_mode_provider.dart';
import 'package:wordle_turkce/provider/theme_provider.dart';
import 'package:wordle_turkce/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var prefs = await SharedPreferences.getInstance();

  await readWordsJson();

  bool isDarkMode;
  bool isColorBlindModeActive;

  if (prefs.containsKey("isDarkMode")) {
    isDarkMode = prefs.getBool("isDarkMode")!;
  } else {
    prefs.setBool("isDarkMode", true);
    isDarkMode = true;
  }

  if (prefs.containsKey("isColorBlindModeActive")) {
    isColorBlindModeActive = prefs.getBool("isColorBlindModeActive")!;
  } else {
    prefs.setBool("isColorBlindModeActive", false);
    isColorBlindModeActive = false;
  }

  if (!prefs.containsKey("wordleIndex")) {
    prefs.setInt("wordleIndex", 0);
  }

  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(isDarkMode: isDarkMode)),
    ChangeNotifierProvider<ColorBlindModeProvider>(
        create: (context) => ColorBlindModeProvider(
            isColorBlindModeActive: isColorBlindModeActive)),
  ], child: const MyApp()));
}

Future<void> readWordsJson() async {
  final String response = await rootBundle.loadString("assets/words.json");
  var wordsHashMap = await json.decode(response);
  var words = wordsHashMap["words"]!;
  var wordsToLowerCase =
      words.map((word) => word.toLowerCase()).toList();
  Words.words = wordsToLowerCase;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, ColorBlindModeProvider>(
        builder: (_, themeMode, colorBlindMode, child) {
      return MaterialApp(
        title: 'WORDLE TÜRKÇE',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: const Home(),
      );
    });
  }
}
