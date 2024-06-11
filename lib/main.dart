import 'package:expense_tracker/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black) //appBar
              ),
          colorScheme: ColorScheme.light(onPrimary: Colors.white),
          cardTheme: ThemeData().cardTheme.copyWith(
                color: Colors.black,
                elevation: 23.0,
              ),
          iconTheme: IconThemeData(
            color: Colors.black,
          )),

      darkTheme: ThemeData.dark().copyWith(
        cardTheme: ThemeData().cardTheme.copyWith(
              color: Colors.black,
              elevation: 23.0,
            ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black) //appBar
            ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        colorScheme: ColorScheme.dark(onPrimary: Colors.white),
      ),

      // themeMode: ThemeMode.dark,
      home: const Center(
        child: HomePage(),
      ),
    );
  }
}
