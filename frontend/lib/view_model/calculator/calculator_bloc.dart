import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fuel_prices/view_model/converter/string_to_int.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  StringConverter? stringConverter;
  CalculatorBloc({required stringConverter}) : super(CalculatorInitial()) {
    on<PriceChange>(onPriceChange);
    on<QuantityChange>(onQuantityChange);
  }
  Future<void>? onPriceChange(
      PriceChange event, Emitter<CalculatorState> emit) async {
    if (event.value == "") {
      stringConverter = StringConverter(value: "0");
      double value = stringConverter!.convert();
      double quantity = value / 160;
      emit(CalculatorStateChange(value: quantity.toString()));
    } else {
      stringConverter = StringConverter(value: event.value);
      double value = stringConverter!.convert();
      double quantity = value / 160;
      emit(CalculatorStateChange(value: quantity.toString()));
    }
  }

  Future<void>? onQuantityChange(
      QuantityChange event, Emitter<CalculatorState> emit) async {
    if (event.value == "") {
      stringConverter = StringConverter(value: "0");
      double value = stringConverter!.convert();
      double quantity = value * 160;
      emit(QuantityState(value: quantity.toString()));
    } else {
      stringConverter = StringConverter(value: event.value);
      double value = stringConverter!.convert();
      double quantity = value * 160;
      emit(QuantityState(value: quantity.toString()));
    }
  }
}
