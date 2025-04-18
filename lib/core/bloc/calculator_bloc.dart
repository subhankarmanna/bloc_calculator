import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState.initial()) {
    on<NumberPressed>((event, emit) {
      if (state.operator.isEmpty) {
        // Input for first number
        final updated = state.input1 == '0' ? event.number : state.input1 + event.number;
        emit(state.copyWith(input1: updated));
      } else {
        // Input for second number
        final updated = state.input2 + event.number;
        emit(state.copyWith(input2: updated));
      }
    });

    on<OperatorPressed>((event, emit) {
      if (state.input1.isNotEmpty && state.operator.isEmpty) {
        emit(state.copyWith(operator: event.operator));
      }
    });

    on<ClearPressed>((event, emit) {
      emit(CalculatorState.initial());
    });

    on<DeletePressed>((event, emit) {
      if (state.input2.isNotEmpty) {
        emit(state.copyWith(input2: state.input2.substring(0, state.input2.length - 1)));
      } else if (state.operator.isNotEmpty) {
        emit(state.copyWith(operator: ''));
      } else if (state.input1.isNotEmpty) {
        emit(state.copyWith(input1: state.input1.substring(0, state.input1.length - 1)));
      }
    });

    on<CalculateResultPressed>((event, emit) {
      try {
        final a = double.tryParse(state.input1) ?? 0;
        final b = double.tryParse(state.input2) ?? 0;
        double? result = 0;

        switch (state.operator) {
          case '+':
            result = a + b;
            break;
          case '-':
            result = a - b;
            break;
          case '×':
            result = a * b;
            break;
          case '÷':
            result = b != 0 ? a / b : 0;
            break;
          case '%':
            final intA = int.tryParse(state.input1) ?? 0;
            final intB = int.tryParse(state.input2) ?? 1;
            result = intB != 0 ? (intA % intB).toDouble() : 0;
            break;
        }
        emit(state.copyWith(result: '= $result'));

      } catch (e) {
        emit(state.copyWith(result: 'Error'));
      }
    });
  }
}
