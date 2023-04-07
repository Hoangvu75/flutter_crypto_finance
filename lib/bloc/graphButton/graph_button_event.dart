abstract class GraphButtonEvent {
  int position;
  GraphButtonEvent({required this.position});
}

class ChangeGraphButtonPositionEvent extends GraphButtonEvent {
  ChangeGraphButtonPositionEvent({required super.position});
}
