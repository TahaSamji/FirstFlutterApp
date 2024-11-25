import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/headlines_bloc.dart';
import 'package:flutter_application_1/headlinesView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) =>
                          HeadlineBloc()..add(FetchHeadlines()),
                      child: const HeadlinesView(),
                    ))));
  }

@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Center(
      child: Image.asset(
        'assets/news.png',
        width: 70,
        height: 70, 
        fit: BoxFit.contain, 
      ),
    ),
  );
}
}