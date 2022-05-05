part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {}

class CalculatorStateChange extends CalculatorState {
  final String value;
  const CalculatorStateChange({required this.value});
  @override
  List<Object> get props => [value];
}

class QuantityState extends CalculatorState {
  final String value;
  const QuantityState({required this.value});
  @override
  List<Object> get props => [value];
}
