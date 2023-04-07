import 'package:finance_tracking/bloc/trendingNewsList/trending_news_list_bloc.dart';
import 'package:finance_tracking/screens/currency/components/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cryptoList/crypto_list_bloc.dart';
import '../../bloc/cryptoList/crypto_list_event.dart';
import '../../bloc/trendingNewsList/trending_news_list_event.dart';
import '../../generated/color.dart';
import '../../generated/dimension.dart';
import 'components/app_bar_carousel.dart';
import 'components/crypto_staggered_grid_view.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> with AutomaticKeepAliveClientMixin<CurrencyScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge && _scrollController.position.pixels > 0) {
        context.read<CryptoListBloc>().add(AddMoreCryptoListEvent());
      }
    });
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2), () {
      context.read<TrendingNewsListBloc>().add(ReloadTrendingNewsListEvent());
      context.read<CryptoListBloc>().add(ReloadCryptoListEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  pinned: false,
                  snap: false,
                  floating: false,
                  expandedHeight: sizeHeight(context) * 0.3,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: const FlexibleSpaceBar(
                    background: AppBarCarousel(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: sizeHeight(context) * 0.05,
                  ),
                ),
                const CryptoStaggeredGridView(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: sizeHeight(context) * 0.05,
                  ),
                ),
                const CryptoList(),
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

  @override
  bool get wantKeepAlive => true;
}
