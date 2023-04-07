import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../bloc/indicator/indicator_bloc.dart';
import '../../../bloc/indicator/indicator_event.dart';
import '../../../bloc/indicator/indicator_state.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class AppBarCarousel extends StatefulWidget {
  const AppBarCarousel({super.key});

  @override
  State<AppBarCarousel> createState() => _AppBarCarouselState();
}

class _AppBarCarouselState extends State<AppBarCarousel> {
  final PageController pageController = PageController(initialPage: 0, keepPage: true);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> carouselImageWidgets = [
      const CarouselImage(
        imageUrl: "https://s2.coinmarketcap.com/static/cloud/img/CMC_Headlines.png?_=b198470",
      ),
      const CarouselImage(
        imageUrl:
            "https://i0.wp.com/www.ripplesnigeria.com/wp-content/uploads/2020/12/banner_1.jpg?fit=650%2C350&ssl=1",
      ),
      const CarouselImage(
        imageUrl:
            "https://101blockchains.com/wp-content/uploads/2022/09/crypto-fundamentals-trading-and-investing-v1.png",
      ),
    ];

    return BlocProvider(
      create: (context) => IndicatorBloc(),
      child: BlocBuilder<IndicatorBloc, IndicatorState>(builder: (context, indicatorState) {
        return Stack(
          children: [
            SizedBox(
              height: sizeHeight(context) * 0.3,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemCount: 3,
                onPageChanged: (int page) {
                  currentPage = page;
                  context.read<IndicatorBloc>().add(ChangeIndicatorPosition(position: currentPage));
                },
                itemBuilder: (BuildContext context, int index) {
                  return CarouselPage(
                    pageController: pageController,
                    widget: carouselImageWidgets[index],
                    index: index,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IndicatorList(
                pageController: pageController,
                indicatorState: indicatorState,
              ),
            )
          ],
        );
      }),
    );
  }
}

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: sizeHeight(context) * 0.3,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                backgroundColor.withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselPage extends StatelessWidget {
  const CarouselPage({
    super.key,
    required this.widget,
    required this.index,
    required this.pageController,
  });

  final PageController pageController;
  final Widget widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        pageController.jumpTo(pageController.offset - details.delta.dx * 2);
      },
      child: widget,
    );
  }
}

class IndicatorList extends StatelessWidget {
  const IndicatorList({
    super.key,
    required this.indicatorState,
    required this.pageController,
  });

  final PageController pageController;
  final IndicatorState indicatorState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleIndicator(
          position: 0,
          indicatorState: indicatorState,
          pageController: pageController,
        ),
        SingleIndicator(
          position: 1,
          indicatorState: indicatorState,
          pageController: pageController,
        ),
        SingleIndicator(
          position: 2,
          indicatorState: indicatorState,
          pageController: pageController,
        )
      ],
    );
  }
}

class SingleIndicator extends StatelessWidget {
  const SingleIndicator({
    super.key,
    required this.position,
    required this.indicatorState,
    required this.pageController,
  });

  final int position;
  final IndicatorState indicatorState;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          pageController.animateToPage(
            position,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: indicatorState.position == position ? 15 : 10,
          width: indicatorState.position == position ? 50 : 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              indicatorState.position == position
                  ? BoxShadow(
                      color: primaryColor.withOpacity(0.72),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 0),
                    )
                  : const BoxShadow(
                      color: Colors.transparent,
                    )
            ],
            color: indicatorState.position == position ? primaryColor : const Color(0XFFEAEAEA),
          ),
        ),
      ),
    );
  }
}
