import 'package:filmi_safari/presentation/Authentication/login_screen.dart';
import 'package:filmi_safari/presentation/onboarding/onboard_screen.dart';
import 'package:filmi_safari/presentation/splash/splash_screen.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/blocs/internet bloc/internet_bloc.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'FilmiSafari',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        // fontFamily: "QuickSand",
        primaryColor: primaryRed,
        primarySwatch: createMaterialColor(primaryRed),
        appBarTheme:const AppBarTheme(elevation: 0)
      ),
        home: const SplashScreen(),
      ),
    );
  }
}

//Function to create a MaterialColor from a single color
MaterialColor createMaterialColor(Color color) {
  List<Color> shades = [
    color,
    Color.lerp(color, Colors.black, 0.1)!,
    Color.lerp(color, Colors.black, 0.2)!,
    Color.lerp(color, Colors.black, 0.3)!,
    Color.lerp(color, Colors.black, 0.4)!,
    Color.lerp(color, Colors.black, 0.5)!,
    Color.lerp(color, Colors.black, 0.6)!,
    Color.lerp(color, Colors.black, 0.7)!,
    Color.lerp(color, Colors.black, 0.8)!,
    Color.lerp(color, Colors.black, 0.9)!,
  ];

  return MaterialColor(color.value, {
    50: shades[0],
    100: shades[1],
    200: shades[2],
    300: shades[3],
    400: shades[4],
    500: shades[5],
    600: shades[6],
    700: shades[7],
    800: shades[8],
    900: shades[9],
  });
}