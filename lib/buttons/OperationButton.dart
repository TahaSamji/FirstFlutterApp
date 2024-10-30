import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:provider/provider.dart';

class Operationbutton extends StatelessWidget {
  final String i;
  final Color? color;
  final Color? textColor;

  const Operationbutton(this.i, this.color, this.textColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor:color,
      ),
      onPressed: () {
        if (i == "=") {
          context.read<Counter>().calculateResult();
        } else if (i == "AC") {
          context.read<Counter>().clear();
        }
          else if(i == "+/-"){
           context.read<Counter>().invertSign();
          }
    else {
         
          context.read<Counter>().setOperator(i);
        }
      },
      child: Text(
        i,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
