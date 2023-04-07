abstract class IndicatorEvent {
  int position;
  IndicatorEvent({required this.position});
}

class ChangeIndicatorPosition extends IndicatorEvent {
  ChangeIndicatorPosition({required super.position});
}
