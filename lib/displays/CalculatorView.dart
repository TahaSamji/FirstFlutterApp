
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Calculator.dart';
import 'package:flutter_application_1/displays/CalculationhistoryDrawer.dart';
import 'package:flutter_application_1/displays/Keypad.dart';

class Calculatorview extends StatelessWidget {
  static const sidePadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  AppBar(
        backgroundColor: Colors.black,
      
        leading:Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.orange, // Set the color of the drawer icon here
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const HistoryDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(
              mainAxisSize: MainAxisSize.max,  
            mainAxisAlignment: MainAxisAlignment.end,  
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Count(),
              KeyPad(),
            ],
          ),
        ),
      ),
    );
  }
}