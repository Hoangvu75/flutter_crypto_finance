import 'package:finance_tracking/bloc/cryptoList/crypto_list_bloc.dart';
import 'package:finance_tracking/bloc/cryptoList/crypto_list_event.dart';
import 'package:finance_tracking/bloc/cryptoList/crypto_list_state.dart';
import 'package:finance_tracking/bloc/graphButton/graph_button_bloc.dart';
import 'package:finance_tracking/generated/fontFamily.dart';
import 'package:finance_tracking/models/crypto.dart';
import 'package:finance_tracking/screens/currencyDetails/currency_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:page_transition/page_transition.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CryptoListBody();
  }
}

class CryptoListBody extends StatefulWidget {
  const CryptoListBody({super.key});

  @override
  State<CryptoListBody> createState() => _CryptoListBodyState();
}

class _CryptoListBodyState extends State<CryptoListBody> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<CryptoListBloc>().add(LoadCryptoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(sizeWidth(context) * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crypto current price",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontFamily: fontsSVNGilroySemiBold,
                    color: normalTextColor,
                  ),
            ),
            SizedBox(
              height: sizeHeight(context) * 0.02,
            ),
            BlocBuilder<CryptoListBloc, CryptoListState>(
              builder: (context, cryptoListState) {
                if (cryptoListState is CryptoListLoadingState) {
                  return Container();
                } else if (cryptoListState is CryptoListLoadedState) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List<CoinCard>.generate(
                      cryptoListState.cryptoList.length,
                      (index) {
                        return CoinCard(
                          index: index,
                          crypto: cryptoListState.cryptoList[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoinCard extends StatefulWidget {
  const CoinCard({
    super.key,
    required this.index,
    required this.crypto,
  });

  final int index;
  final Crypto crypto;

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addListener(() => setState(() {}));

    Future.delayed(Duration(milliseconds: (widget.index % 5) * 200 + 200), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: Transform(
        transform: Matrix4.translationValues(50.0 * (1 - _animation.value), 0, 0),
        child: ScaleTap(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: BlocProvider(
                  create:  (context) => GraphButtonBloc(),
                  child: const CurrencyDetailsScreen(),
                ),
              ),
            );
          },
          child: Container(
            width: sizeWidth(context),
            margin: EdgeInsets.only(
              bottom: sizeHeight(context) * 0.03,
            ),
            padding: EdgeInsets.symmetric(
              vertical: sizeHeight(context) * 0.02,
              horizontal: sizeWidth(context) * 0.04,
            ),
            decoration: BoxDecoration(
              color: cardBackgroundColor,
              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.025),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(sizeWidth(context) * 0.15),
                  child: Image.network(
                    widget.crypto.image!,
                    width: sizeWidth(context) * 0.15,
                    height: sizeWidth(context) * 0.15,
                  ),
                ),
                SizedBox(
                  width: sizeWidth(context) * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.crypto.shortName}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontFamily: fontsSVNGilroySemiBold,
                            color: normalTextColor,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
                    ),
                    Text(
                      "${widget.crypto.name}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontFamily: fontsSVNGilroyRegular,
                            color: normalTextColor,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
                    ),
                    Text(
                      "\$ ${widget.crypto.currentPrice}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontFamily: fontsSVNGilroyMedium,
                            color: greyTextColor,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: sizeHeight(context) * 0.015,
                    horizontal: sizeWidth(context) * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: widget.crypto.fluctuatedPercent!.isNegative
                        ? decreasedValueColor.withOpacity(0.2)
                        : increasedValueColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(sizeWidth(context) * 0.025),
                  ),
                  child: Text(
                    widget.crypto.fluctuatedPercent!.isNegative
                        ? "- ${widget.crypto.fluctuatedPercent!.abs()}%"
                        : "+ ${widget.crypto.fluctuatedPercent}%",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold,
                          color: widget.crypto.fluctuatedPercent!.isNegative
                              ? decreasedValueColor
                              : increasedValueColor,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
