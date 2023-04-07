import 'package:finance_tracking/bloc/graphButton/graph_button_bloc.dart';
import 'package:finance_tracking/bloc/graphButton/graph_button_event.dart';
import 'package:finance_tracking/bloc/graphButton/graph_button_state.dart';
import 'package:finance_tracking/screens/currencyDetails/components/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';

class CurrencyDetailsScreen extends StatefulWidget {
  const CurrencyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyDetailsScreen> createState() => _CurrencyDetailsScreenState();
}

class _CurrencyDetailsScreenState extends State<CurrencyDetailsScreen> {
  late ScrollController _scrollController;
  late bool _scrollControllerOnTopState;

  _scrollListener() {
    if (_scrollController.offset > sizeHeight(context) * 0.075) {
      setState(() {
        _scrollControllerOnTopState = true;
      });
    } else {
      setState(() {
        _scrollControllerOnTopState = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _scrollControllerOnTopState = false;
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: sizeWidth(context),
          height: sizeHeight(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.9),
              ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: sizeHeight(context) * 0.2,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: _scrollControllerOnTopState ? primaryColor : Colors.transparent,
                  leading: ScaleTap(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: sizeWidth(context) * 0.075,
                    ),
                  ),
                  leadingWidth: sizeWidth(context) * 0.15,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: _scrollControllerOnTopState ? null : EdgeInsets.all(sizeWidth(context) * 0.04),
                    title: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      curve: Curves.ease,
                      duration: const Duration(seconds: 2),
                      builder: (BuildContext context, double tween, Widget? child) {
                        return Opacity(
                          opacity: tween,
                          child: Transform(
                            transform: Matrix4.translationValues(-50 * (1 - tween), 0, 0),
                            child: Text(
                              "Bitcoin",
                              style: _scrollControllerOnTopState
                                  ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        fontFamily: fontsSVNGilroySemiBold,
                                        color: normalTextColor,
                                      )
                                  : Theme.of(context).textTheme.headlineMedium!.copyWith(
                                        fontFamily: fontsSVNGilroySemiBold,
                                        color: normalTextColor,
                                      ),
                            ),
                          ),
                        );
                      },
                    ),
                    centerTitle: _scrollControllerOnTopState ? true : false,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth(context) * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ 28455.08",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ ${(28455.08 * 0.03).toStringAsFixed(2)}",
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontFamily: fontsSVNGilroyRegular,
                                    color: increasedValueColor,
                                  ),
                            ),
                            SizedBox(
                              width: sizeWidth(context) * 0.04,
                            ),
                            Text(
                              "(0.03%)",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontFamily: fontsSVNGilroyRegular,
                                    color: normalTextColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sizeHeight(context) * 0.04,
                    ),
                    child: const LineChartSample2(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth(context) * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        GraphTimeButton(
                          time: '1H',
                          position: 0,
                        ),
                        GraphTimeButton(
                          time: '1D',
                          position: 1,
                        ),
                        GraphTimeButton(
                          time: '1W',
                          position: 2,
                        ),
                        GraphTimeButton(
                          time: '1M',
                          position: 3,
                        ),
                        GraphTimeButton(
                          time: '1Y',
                          position: 4,
                        ),
                        GraphTimeButton(
                          time: 'All',
                          position: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth(context) * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: sizeHeight(context) * 0.04,
                        ),
                        Text(
                          "Summary",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontFamily: fontsSVNGilroyBold,
                                color: Colors.redAccent,
                              ),
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroySemiBold,
                                color: normalTextColor,
                              ),
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        const PriceDetails(
                          title: "Last",
                          price: "28455.08",
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        const PriceDetails(
                          title: "High",
                          price: "40371.03",
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        const PriceDetails(
                          title: "Low",
                          price: "25434.23",
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        const PriceDetails(
                          title: "Change",
                          price: "1247.52",
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: sizeHeight(context) * 0.25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GraphTimeButton extends StatelessWidget {
  const GraphTimeButton({
    super.key,
    required this.time,
    required this.position,
  });

  final String time;
  final int position;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        context.read<GraphButtonBloc>().add(ChangeGraphButtonPositionEvent(position: position));
      },
      child: BlocBuilder<GraphButtonBloc, GraphButtonState>(builder: (context, graphButtonState) {
        return Container(
          padding: EdgeInsets.all(sizeWidth(context) * 0.02),
          decoration: BoxDecoration(
              color: graphButtonState.position == position
                  ? increasedValueColor.withOpacity(0.75)
                  : backgroundColor.withOpacity(0.75),
              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.02)),
          child: Text(
            time,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontFamily: fontsSVNGilroyMedium,
                  color: normalTextColor,
                ),
          ),
        );
      }),
    );
  }
}

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: fontsSVNGilroyMedium,
                color: greyTextColor,
              ),
        ),
        const Spacer(),
        Text(
          price,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: fontsSVNGilroyRegular,
                color: greyTextColor,
              ),
        ),
      ],
    );
  }
}
