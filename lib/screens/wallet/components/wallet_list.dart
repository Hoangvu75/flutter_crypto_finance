import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:finance_tracking/bloc/walletCoins/wallet_coins_bloc.dart';
import 'package:finance_tracking/bloc/walletCoins/wallet_coins_state.dart';
import 'package:finance_tracking/bloc/walletNFTs/wallet_nfts_bloc.dart';
import 'package:finance_tracking/bloc/walletNFTs/wallet_nfts_state.dart';
import 'package:finance_tracking/models/wallet_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';
import '../../../models/wallet_nfts.dart';

class WalletList extends StatefulWidget {
  const WalletList({
    super.key,
  });

  @override
  State<WalletList> createState() => _WalletListState();
}

class _WalletListState extends State<WalletList> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.04),
                  child: ScaleTap(
                    onPressed: () {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: sizeHeight(context) * 0.01,
                          ),
                          child: Center(
                            child: Text(
                              "Coins",
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontFamily: fontsSVNGilroySemiBold,
                                    color: normalTextColor.withOpacity(0.9),
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: _currentPage == 0 ? primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04)),
                          height: sizeHeight(context) * 0.005,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.04),
                  child: ScaleTap(
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: sizeHeight(context) * 0.01,
                          ),
                          child: Center(
                            child: Text(
                              "NFTs",
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontFamily: fontsSVNGilroySemiBold,
                                    color: normalTextColor.withOpacity(0.9),
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: _currentPage == 1 ? primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04)),
                          height: sizeHeight(context) * 0.005,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizeHeight(context) * 0.02,
          ),
          ExpandablePageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [WalletCoinList(), WalletNFTList()],
          ),
        ],
      ),
    );
  }
}

class WalletCoinList extends StatelessWidget {
  const WalletCoinList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizeWidth(context) * 0.04),
      child: BlocBuilder<WalletCoinsBloc, WalletCoinsState>(
        builder: (context, walletCoinsState) {
          double totalPrice = 0;
          for (var i = 0; i < walletCoinsState.walletCoinList.length; i++) {
            totalPrice +=
                walletCoinsState.walletCoinList[i].quantity! * walletCoinsState.walletCoinList[i].currentPrice!;
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: walletCoinsState.walletCoinList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: sizeWidth(context) * 0.05,
              mainAxisSpacing: sizeWidth(context) * 0.05,
            ),
            itemBuilder: (context, index) {
              double price = walletCoinsState.walletCoinList[index].quantity! *
                  walletCoinsState.walletCoinList[index].currentPrice!;
              String percentage = "${((price / totalPrice) * 100).toStringAsFixed(2)}%";
              return WalletCoinWidget(
                coin: walletCoinsState.walletCoinList[index],
                percentage: percentage,
              );
            },
          );
        },
      ),
    );
  }
}

class WalletCoinWidget extends StatelessWidget {
  const WalletCoinWidget({
    super.key,
    required this.coin,
    required this.percentage,
  });

  final Coin coin;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double tween, Widget? child) {
        return Opacity(
          opacity: tween,
          child: Transform.scale(
            scale: tween,
            child: ScaleTap(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(sizeWidth(context) * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(sizeWidth(context) * 0.1),
                          child: Image.network(
                            coin.image!,
                            width: sizeWidth(context) * 0.1,
                            height: sizeWidth(context) * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: sizeWidth(context) * 0.04,
                        ),
                        Flexible(
                          child: Text(
                            coin.name!,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroySemiBold,
                                  color: normalTextColor,
                                ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$ ${coin.currentPrice}",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor.withOpacity(0.5),
                              ),
                        ),
                        const Spacer(),
                        Text(
                          percentage,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: increasedValueColor,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.02,
                    ),
                    Text(
                      "${coin.quantity} ${coin.shortName}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontFamily: fontsSVNGilroySemiBold,
                            color: normalTextColor,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
                    ),
                    Text(
                      "\$ ${(coin.quantity! * coin.currentPrice!).toStringAsFixed(3)}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold, color: normalTextColor, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WalletNFTList extends StatelessWidget {
  const WalletNFTList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizeWidth(context) * 0.04),
      child: BlocBuilder<WalletNFTsBloc, WalletNFTsState>(
        builder: (context, walletNFTsState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: walletNFTsState.walletNFTList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              crossAxisSpacing: sizeWidth(context) * 0.05,
              mainAxisSpacing: sizeWidth(context) * 0.05,
            ),
            itemBuilder: (context, index) {
              return WalletNFTWidget(
                nft: walletNFTsState.walletNFTList[index],
              );
            },
          );
        },
      ),
    );
  }
}

class WalletNFTWidget extends StatelessWidget {
  const WalletNFTWidget({
    super.key,
    required this.nft,
  });

  final NFT nft;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double tween, Widget? child) {
        return Opacity(
          opacity: tween,
          child: Transform.scale(
            scale: tween,
            child: ScaleTap(
              onPressed: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.network(
                            nft.image!,
                            fit: BoxFit.fitWidth,
                            loadingBuilder:(context, child, loadingProgress) {
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
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Text(
                            nft.name!,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroySemiBold,
                                  color: normalTextColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
