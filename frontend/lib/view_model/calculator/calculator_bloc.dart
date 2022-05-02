import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fuel_prices/view_model/converter/string_to_int.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  StringConverter? stringConverter;
  CalculatorBloc({required stringConverter})
      : super(CalculatorInitial()) {
    on<PriceChange>(onPriceChange);
  }
  Future<void>? onPriceChange(
        PriceChange event, Emitter<CalculatorState> emit) async {
      if(event.value==""){
      stringConverter = StringConverter(value:"0");
      int value = stringConverter!.convert();
      double quantity = value / 160;
      emit(CalculatorStateChange(value: quantity.toString()));

      }else{
      stringConverter = StringConverter(value: event.value);
      int value = stringConverter!.convert();
      double quantity = value / 160;
      emit(CalculatorStateChange(value: quantity.toString()));

      }
      
    }
}