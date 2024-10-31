import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:provider/provider.dart';

class Operationbutton extends StatelessWidget {
  final String i;
  final Color? color;
  final Color? textColor;
  final double size;

  const Operationbutton(this.i, this.color, this.textColor, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(55, 55),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        textStyle: TextStyle(
          fontSize: 20, 
          color: textColor,
          letterSpacing: 0, 
          fontWeight: FontWeight.bold,
        ),
        
        backgroundColor: color,
      ),
      onPressed: () {
        if (i == "=") {
          context.read<Counter>().calculateResult();
        } else if (i == "AC") {
          context.read<Counter>().clear();
        } else if (i == "+/-") {
          context.read<Counter>().invertSign();
        } else {
          context.read<Counter>().setOperator(i);
        }
      },
      child: 
      Text(
        i,
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2,
          color: textColor
        ),
      ),
    );
  }
}
