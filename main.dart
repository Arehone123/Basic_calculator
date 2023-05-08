import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _output = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operator == '×') {
          _output = (_num1 * _num2).toString();
        } else if (_operator == '÷') {
          _output = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else {
        _output += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed: () => _buttonPressed(buttonText),
          padding: EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Calculator'),
    ),
    body: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
    child: Text(
    _output,
    style: TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Expanded(
    child: Divider(),
    ),
    Column(
    children: <Widget>[
    Row(
    children: <Widget>[
    _buildButton('7', Colors.grey[700]!),
    _buildButton('8', Colors.grey[700]!),
    _buildButton('9', Colors.grey[700]!),
    _buildButton('÷', Colors.black),
    ],
    ),
    Row(
    children: <Widget>[
    _buildButton('4', Colors.grey[700]!),
    _buildButton('5', Colors.grey[700]!),
    _buildButton('6', Colors.grey[700]!),
      _buildButton('×', Colors.black),
    ],
    ),
      Row(
        children: <Widget>[
          _buildButton('1', Colors.grey[700]!),
          _buildButton('2', Colors.grey[700]!),
          _buildButton('3', Colors.grey[700]!),
          _buildButton('-', Colors.black),
        ],
      ),
      Row(
        children: <Widget>[
          _buildButton('C', Colors.black),
          _buildButton('0', Colors.grey[700]!),
          _buildButton('.', Colors.grey[700]!),
          _buildButton('+', Colors.black),
        ],
      ),
      Row(
        children: <Widget>[
          _buildButton('=', Colors.black),
        ],
      ),
    ],
    ),
    ],
    ),
    );
  }
}

