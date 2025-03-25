import 'package:flutter/material.dart';
import 'app_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AppBody(false),
        '/u': (context) => const AppBody(true),
      },
      title: 'Vladyslav Kramarenko',
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          backgroundColor: Colors.black,
          accentColor: Colors.yellow[600],
        ).copyWith(
          secondary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        splashColor: Colors.yellow[600],
        primaryColor: Colors.grey[400],
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 57.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          displayMedium: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          displaySmall: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          headlineMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          titleLarge: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Colors.grey[400],
            fontFamily: 'ProximaNova',
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.grey[400],
            fontFamily: 'ProximaNova',
          ),
          bodySmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.grey[400],
            fontFamily: 'ProximaNova',
          ),
          labelLarge: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          labelMedium: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
          labelSmall: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProximaNova',
          ),
        ),
      ),
    );
  }
}
