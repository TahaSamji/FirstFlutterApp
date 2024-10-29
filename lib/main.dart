import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page.dart';
import 'package:flutter_application_1/bloc/bloc_dummy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BlocProvider(
      create: (context) => ProductBloc()..add(FetchProducts()),
      child: const MyProducts(),
    )
    );
  }
}