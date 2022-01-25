import 'package:flutter/material.dart';
import 'package:clima_flutter/Screens/loading_screen.dart';
import 'package:clima_flutter/Screens/location_Screen.dart';
import 'package:clima_flutter/Screens/city_screen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id:(context)=>LoadingScreen(),
       CityScreen.id:(context)=>CityScreen(),
       LocationScreen.id:(context)=>LocationScreen(),
      },

    );
  }
}
