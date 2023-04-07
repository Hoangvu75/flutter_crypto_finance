import 'package:bloc/bloc.dart';
import 'graph_button_event.dart';
import 'graph_button_state.dart';

class GraphButtonBloc extends Bloc<GraphButtonEvent, GraphButtonState> {
  GraphButtonBloc() : super(GraphButtonInitialState()) {
    on<GraphButtonEvent>((event, emit) {
      emit(GraphButtonState(position: event.position));
    });
  }
}
