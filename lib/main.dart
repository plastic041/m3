import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(Brightness.light),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      primarySwatch: Colors.cyan,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoSlabTextTheme(baseTheme.textTheme),
    );
  }
}
