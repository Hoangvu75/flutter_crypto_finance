import 'package:bloc/bloc.dart';
import 'indicator_event.dart';
import 'indicator_state.dart';

class IndicatorBloc extends Bloc<IndicatorEvent, IndicatorState> {
  IndicatorBloc() : super(IndicatorInitialState()) {
    on<IndicatorEvent>((event, emit) {
      emit(IndicatorState(position: event.position));
    });
  }
}
