import 'package:finance_tracking/bloc/graphButton/graph_button_bloc.dart';
import 'package:finance_tracking/bloc/graphButton/graph_button_state.dart';
import 'package:finance_tracking/generated/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/fontFamily.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    decreasedValueColor,
    increasedValueColor,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: BlocBuilder<GraphButtonBloc, GraphButtonState>(
              builder: (context, graphButtonState) {
                return LineChart(
                  data(graphButtonState.flSpotDataList[graphButtonState.position]),
                );
              }
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontFamily: fontsSVNGilroyRegular,
          color: normalTextColor,
        );

    Widget text_0;
    switch (value.toInt()) {
      case 0:
        text_0 = Text('60m\nago', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_0 = Text('45m\nago', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_0 = Text('30m\nago', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_0 = Text('15m\nago', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_0 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    Widget text_1;
    switch (value.toInt()) {
      case 0:
        text_1 = Text('24h\nago', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_1 = Text('18h\nago', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_1 = Text('12h\nago', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_1 = Text('6h\nago', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_1 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    Widget text_2;
    switch (value.toInt()) {
      case 0:
        text_2 = Text('7d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_2 = Text('5d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_2 = Text('3d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_2 = Text('1d\nago', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_2 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    Widget text_3;
    switch (value.toInt()) {
      case 0:
        text_3 = Text('28d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_3 = Text('21d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_3 = Text('14d\nago', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_3 = Text('7d\nago', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_3 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    Widget text_4;
    switch (value.toInt()) {
      case 0:
        text_4 = Text('Jan', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_4 = Text('Apr', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_4 = Text('Jul', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_4 = Text('Oct', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_4 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    Widget text_5;
    switch (value.toInt()) {
      case 0:
        text_5 = Text('2010', style: style, textAlign: TextAlign.center);
        break;
      case 3:
        text_5 = Text('2014', style: style, textAlign: TextAlign.center);
        break;
      case 6:
        text_5 = Text('2018', style: style, textAlign: TextAlign.center);
        break;
      case 9:
        text_5 = Text('2022', style: style, textAlign: TextAlign.center);
        break;
      default:
        text_5 = Text('', style: style, textAlign: TextAlign.center);
        break;
    }

    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return SideTitleWidget(
          axisSide: meta.axisSide,
          child: BlocBuilder<GraphButtonBloc, GraphButtonState>(
            builder: (context, graphButtonState) {
              if (graphButtonState.position == 0) {
                return text_0;
              } else if (graphButtonState.position == 1) {
                return text_1;
              } else if (graphButtonState.position == 2) {
                return text_2;
              } else if (graphButtonState.position == 3) {
                return text_3;
              } else if (graphButtonState.position == 4) {
                return text_4;
              } else if (graphButtonState.position == 5) {
                return text_5;
              }
              return Container();
            }
          ),
        );
      }
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: fontsSVNGilroyRegular,
          color: normalTextColor,
        );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData data(List<FlSpot> flSpotList) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: greyTextColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: greyTextColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: flSpotList,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
