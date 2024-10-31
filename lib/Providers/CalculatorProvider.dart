import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  String _value = "0";
  double? _previousValue;
  String _operator = "";
  bool _isNewEntry = false;
  final List<String> _history = []; 

  String get value => _value;
  List<String> get history => _history; 

  void changeValue(String newValue) {
    if (_value.contains(".") && newValue == ".") {
      return; 
    }
    if (_isNewEntry) {
      _value = newValue;
      _isNewEntry = false;
    } else {
      _value = _value == "0" ? newValue : _value + newValue;
    }
    notifyListeners();
  }

  void setOperator(String operator) {
    if (_operator.isEmpty) {
      _previousValue = double.tryParse(_value);
      _operator = operator;
      _isNewEntry = true;
    } else {
      calculateResult();
      _operator = operator;
      _previousValue = double.tryParse(_value);
      _isNewEntry = true;
    }
    notifyListeners();
  }

  void calculateResult() {
    if (_previousValue != null && _operator.isNotEmpty) {
      double currentValue = double.tryParse(_value) ?? 0;
      double result;

      switch (_operator) {
        case "+":
          result = _previousValue! + currentValue;
          break;
        case "-":
          result = _previousValue! - currentValue;
          break;
        case "×":
          result = _previousValue! * currentValue;
          break;
        case "÷":
          result = currentValue != 0 ? _previousValue! / currentValue : 0;
          break;
        case "%":
          result = currentValue != 0 ? currentValue /100: 0;
          break;
        default:
          result = currentValue;
      }

    
      _history.insert(0,_operator!="%" ?  "${_previousValue ?? 0} $_operator $currentValue = $result" : "$_operator $currentValue = $result");
      
      _value = result.toString();
      _previousValue = null;
      _operator = "";
      _isNewEntry = true;
      notifyListeners();
    }
  }

  void clear() {
    _value = "0";
    _previousValue = null;
    _operator = "";
    _isNewEntry = false;
    notifyListeners();
  }
   void clearHistory() {
    
   history.clear();
    notifyListeners();
  }

  void invertSign() {
    _value = _value.startsWith("-") ? _value.substring(1) : "-$_value";
    notifyListeners();
  }

 
}
