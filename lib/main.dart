import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'view/lading/landing_page.dart';

import 'util/hex_color.dart';
import 'view/home/home_page.dart';

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
        return Portal(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.green,
                secondary: Colors.black,
              ),
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
            home: LandingPage(),
          ),
        );
      }
    );
  }
}
