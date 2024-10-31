import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:provider/provider.dart';


class NumberButton extends StatelessWidget {
  final String i;
  final Color? color;
  final Color? Textcolor;



  const NumberButton(this.i,this.color, this.Textcolor,{super.key});
   

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), // Circular shape
        padding: const EdgeInsets.all(20), // Padding inside the button
        backgroundColor: color , // Dark grey background
      ),
      onPressed: () {
        // Button action here
        String newValue = i;
        context.read<Counter>().changeValue(i);
      },
      child: Text(
        i, // Convert integer to string for display
        style:  TextStyle(
          color: Textcolor, // White text color
          fontSize: 20, // Font size for the number
        ),
      ),
    );
  }
}
