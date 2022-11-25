import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'routes/router.gr.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: _buildTheme(Brightness.light),
    );
  }

  ThemeData _buildTheme(brightness) {
    ThemeData baseTheme = ThemeData(
      brightness: brightness,
      primarySwatch: Colors.cyan,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.notoSansTextTheme(baseTheme.textTheme),
    );
  }
}
