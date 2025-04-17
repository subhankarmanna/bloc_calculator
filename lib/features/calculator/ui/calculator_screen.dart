import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/calculator_bloc.dart';
import '../../../core/event/calculator_event.dart';
import '../../../core/state/calculator_state.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "";

  void _onButtonPressed(String buttonText) {
    if (buttonText == "C") {
      context.read<CalculatorBloc>().add(ClearPressed());
    } else if (buttonText == "⌫") {
      context.read<CalculatorBloc>().add(DeletePressed());
    } else if (buttonText == "=") {
      context.read<CalculatorBloc>().add(CalculateResultPressed());
    } else if (["+", "-", "×", "÷"].contains(buttonText)) {
      context.read<CalculatorBloc>().add(OperatorPressed(buttonText));
    } else {
      context.read<CalculatorBloc>().add(NumberPressed(buttonText));
    }
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
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${state.input1}${state.operator}${state.input2}',
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      Text(
                        state.result,
                        style: TextStyle(fontSize: 32, color: Colors.grey),
                      ),
                    ],
                  );
                },
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
                _buildButton("C", Colors.red),
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
