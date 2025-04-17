import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/calculator_bloc.dart';
import 'features/calculator/ui/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BLoC Calculator',
        theme: ThemeData.dark(),
        home: const CalculatorScreen(),
      ),
    );
  }
}
