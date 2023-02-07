import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'view/landing/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.green,
                secondary: Colors.black,
              ),
              textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.blue
              ),
              fontFamily: GoogleFonts.montserrat().fontFamily
            ),
            home: LandingPage(),
          );
      }
    );
  }
}
