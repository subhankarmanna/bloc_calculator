import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _result = "";
      } else if (buttonText == "⌫") {
        _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
      } else if (buttonText == "=") {
        _result = _calculateResult();
      } else {
        _output = _output == "0" ? buttonText : _output + buttonText;
      }
    });
  }

  String _calculateResult() {
    // Add your calculation logic here
    return "= ${_output}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildButton("C", Colors.grey),
                _buildButton("⌫", Colors.grey),
                _buildButton("%", Colors.grey),
                _buildButton("÷", Colors.orange),
                _buildButton("7", Colors.grey[850]!),
                _buildButton("8", Colors.grey[850]!),
                _buildButton("9", Colors.grey[850]!),
                _buildButton("×", Colors.orange),
                _buildButton("4", Colors.grey[850]!),
                _buildButton("5", Colors.grey[850]!),
                _buildButton("6", Colors.grey[850]!),
                _buildButton("-", Colors.orange),
                _buildButton("1", Colors.grey[850]!),
                _buildButton("2", Colors.grey[850]!),
                _buildButton("3", Colors.grey[850]!),
                _buildButton("+", Colors.orange),
                GridTile(
                  child: Container(),
                ),
                _buildButton("0", Colors.grey[850]!),
                _buildButton(".", Colors.grey[850]!),
                _buildButton("=", Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return GestureDetector(
      onTap: () => _onButtonPressed(text),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
