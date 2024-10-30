import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/NumberButton.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:flutter_application_1/buttons/OperationButton.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorList(),
    );
  }
}

class CalculatorList extends StatelessWidget {
  const CalculatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Padding(
              padding: EdgeInsets.all(8.0),
            
              child: Column(
                children: [
                  // First row: AC, +/-, %, ÷
                 const Row( mainAxisAlignment: MainAxisAlignment.end,children: [Count()],),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Operationbutton("AC", Color.fromARGB(255, 189, 184, 184),Colors.black),
                      Operationbutton("+/-", Color.fromARGB(255, 189, 184, 184),Colors.black),
                      Operationbutton("%",Color.fromARGB(255, 189, 184, 184),Colors.black),
                      Operationbutton("÷",Color.fromARGB(255, 255, 190, 10),Colors.white),
                    ],
                  ),
                  // Second row: 7, 8, 9, ×
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberButton("7",Colors.grey[800],Colors.white),
                      NumberButton("8",Colors.grey[800],Colors.white),
                      NumberButton("9",Colors.grey[800],Colors.white),
                      Operationbutton("×",Color.fromARGB(255, 255, 190, 10),Colors.white),
                    ],
                  ),
                  // Third row: 4, 5, 6, -
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberButton("4",Colors.grey[800],Colors.white),
                      NumberButton("5",Colors.grey[800],Colors.white),
                      NumberButton("6",Colors.grey[800],Colors.white),
                      const Operationbutton("-",Color.fromARGB(255, 255, 190, 10),Colors.white),
                    ],
                  ),
                  // Fourth row: 1, 2, 3, +
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberButton("1", Colors.grey[800],Colors.white),
                      NumberButton("2", Colors.grey[800],Colors.white),
                      NumberButton("3", Colors.grey[800],Colors.white),
                      Operationbutton("+",Color.fromARGB(255, 255, 190, 10),Colors.white),
                    ],
                  ),
                  // Fifth row: 0, ., =
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     NumberButton("0",Colors.grey[800],Colors.white),
                      Operationbutton(".",Colors.grey[800],Colors.white),
                      Operationbutton("=",Color.fromARGB(255, 255, 190, 10),Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text(
      '${context.watch<Counter>().value}',
      key: const Key('counterState'),
      
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: Colors.white),
        
    )]);
  }
}
