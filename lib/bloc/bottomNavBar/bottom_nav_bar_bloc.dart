import 'package:bloc/bloc.dart';

import 'bottom_nav_bar_event.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitialState()) {
    on<BottomNavBarEvent>((event, emit) {
      emit(BottomNavBarState(position: event.position));
    });
  }
}
