part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class PriceInitial extends CalculatorEvent {
  final String value;

  const PriceInitial({required this.value});

  @override
  List<Object> get props => [value];
}

class PriceChange extends CalculatorEvent {
  final String value;
  const PriceChange({required this.value});
  @override
  List<Object> get props => [value];
}

class QuantityChange extends CalculatorEvent {
  final String value;
  const QuantityChange({required this.value});

  @override
  List<Object> get props => [value];
}
