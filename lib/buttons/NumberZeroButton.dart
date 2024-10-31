import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:provider/provider.dart';

class NumberZeroButton extends StatelessWidget {
  const NumberZeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          
          shape: const StadiumBorder(
        
          ),
          
          padding: const EdgeInsets.only(left: 75,top:20 ,bottom: 20,right: 75 ), 
          backgroundColor: Colors.grey[800],
          
        ),
        onPressed: () {
          context.read<Counter>().changeValue("0");
        },
        
    child: 
           const Text(
          "0",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
        );
    
 
       
      
         
     
   
  }
}
