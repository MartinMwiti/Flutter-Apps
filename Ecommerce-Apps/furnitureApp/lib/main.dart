import 'package:flutter/material.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      // Create a [ThemeData] that's used to configure a [Theme].
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Applies the DM Sans font family from Google Fonts to every [TextStyle] in the given [textTheme].
        // Now we also apply our text color to all flutter flutter textTheme
        // The displayColor is applied to [headline4], [headline3], [headline2], [headline1], and [caption].
        textTheme: GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Almost all our app bar have this style
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light
        ),
      ),
      home: HomeScreen(),
    );
  }
}

