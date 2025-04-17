class CalculatorState {
  final String input1;
  final String input2;
  final String operator;
  final String result;

  CalculatorState({
    required this.input1,
    required this.input2,
    required this.operator,
    required this.result,
  });

  factory CalculatorState.initial() {
    return CalculatorState(
      input1: '',
      input2: '',
      operator: '',
      result: '',
    );
  }

  CalculatorState copyWith({
    String? input1,
    String? input2,
    String? operator,
    String? result,
  }) {
    return CalculatorState(
      input1: input1 ?? this.input1,
      input2: input2 ?? this.input2,
      operator: operator ?? this.operator,
      result: result ?? this.result,
    );
  }
}
