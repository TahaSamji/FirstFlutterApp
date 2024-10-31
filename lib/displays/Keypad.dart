import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/NumberButton.dart';
import 'package:flutter_application_1/buttons/NumberZeroButton.dart';
import 'package:flutter_application_1/buttons/OperationButton.dart';

class KeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Operationbutton(
                    "AC", Color.fromARGB(255, 189, 184, 184), Colors.black, 20),
                Operationbutton("+/-", Color.fromARGB(255, 189, 184, 184),
                    Colors.black, 20),
                Operationbutton(
                    "%", Color.fromARGB(255, 189, 184, 184), Colors.black, 20),
                Operationbutton(
                    "÷", Color.fromARGB(255, 255, 190, 10), Colors.white, 20),
              ]),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NumberButton("7", Colors.grey[800], Colors.white),
            NumberButton("8", Colors.grey[800], Colors.white),
            NumberButton("9", Colors.grey[800], Colors.white),
            const Operationbutton(
                "×", Color.fromARGB(255, 255, 190, 10), Colors.white, 20),
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NumberButton("4", Colors.grey[800], Colors.white),
            NumberButton("5", Colors.grey[800], Colors.white),
            NumberButton("6", Colors.grey[800], Colors.white),
            const Operationbutton(
                "-", Color.fromARGB(255, 255, 190, 10), Colors.white, 20),
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NumberButton("1", Colors.grey[800], Colors.white),
            NumberButton("2", Colors.grey[800], Colors.white),
            NumberButton("3", Colors.grey[800], Colors.white),
            const Operationbutton(
                "+", Color.fromARGB(255, 255, 190, 10), Colors.white, 20),
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          
            NumberZeroButton(),
            NumberButton(".", Colors.grey[800], Colors.white),
            const Operationbutton(
                "=", Color.fromARGB(255, 255, 190, 10), Colors.white, 20),
          ])
        ],
      ),
    );
  }
}
