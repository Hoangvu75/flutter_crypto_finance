import 'package:fl_chart/fl_chart.dart';

class GraphButtonState {
  List<List<FlSpot>> flSpotDataList = [
    [
      const FlSpot(0, 4),
      const FlSpot(2, 2),
      const FlSpot(4, 2),
      const FlSpot(6, 1),
      const FlSpot(8, 2),
      const FlSpot(10, 3),
      const FlSpot(11, 5),
    ],
    [
      const FlSpot(0, 3),
      const FlSpot(2, 4),
      const FlSpot(4, 1),
      const FlSpot(6, 2),
      const FlSpot(8, 5),
      const FlSpot(10, 1),
      const FlSpot(11, 2),
    ],
    [
      const FlSpot(0, 5),
      const FlSpot(2, 1),
      const FlSpot(4, 3),
      const FlSpot(6, 6),
      const FlSpot(8, 2),
      const FlSpot(10, 4),
      const FlSpot(11, 5),
    ],
    [
      const FlSpot(0, 6),
      const FlSpot(2, 3),
      const FlSpot(4, 2),
      const FlSpot(6, 6),
      const FlSpot(8, 5),
      const FlSpot(10, 1),
      const FlSpot(11, 2),
    ],
    [
      const FlSpot(0, 4),
      const FlSpot(2, 4),
      const FlSpot(4, 5),
      const FlSpot(6, 2),
      const FlSpot(8, 5),
      const FlSpot(10, 2),
      const FlSpot(11, 1),
    ],
    [
      const FlSpot(0, 1),
      const FlSpot(2, 5),
      const FlSpot(4, 2),
      const FlSpot(6, 4),
      const FlSpot(8, 3),
      const FlSpot(10, 3),
      const FlSpot(11, 6),
    ],
  ];
  int position;
  GraphButtonState({required this.position});
}

class GraphButtonInitialState extends GraphButtonState {
  GraphButtonInitialState(): super(position: 0);
}

