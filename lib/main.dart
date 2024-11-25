import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),

          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
